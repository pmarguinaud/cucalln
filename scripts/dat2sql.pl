#!/usr/bin/perl -w

use DBI;
use DBD::SQLite;
use Data::Dumper;
use FileHandle;
use Getopt::Long;
use warnings qw (FATAL all);
use strict;


sub line
{
  my $fh = shift;

  my @line;

  if (defined (my $line = <$fh>))
    {
      for ($line)
        {
          chomp;
          s/^\s*//o;
          s/\s*$//o;
        }
      @line = split (m/\s*;\s*/o, $line);
    }
  return @line;
}


my ($f, $db) = @ARGV;

unless ($db)
  {
    ($db = $f) =~ s/\.dat$//o;
    $db = "$db.db";
  }

unlink ($db);

my $dbh = 'DBI'->connect ("DBI:SQLite:$db", '', '', {RaiseError => 1})
  or die ($DBI::errstr);
$dbh->{RaiseError} = 1;

my $fh = 'FileHandle'->new ("<$f");

my @head = &line ($fh);

my %type = ('C' => 'VARCHAR (255)', 'Z' => 'FLOAT', 'N' => 'INTEGER');

my @req;

for my $head (@head)
  {
    (my $type = $type{substr ($head, 0, 1)}) or die;
    push @req, sprintf ('   %-30s %-30s NOT NULL', $head, $type);
  }

$dbh->prepare (sprintf ("CREATE TABLE timings (\n%s\n)\n", join (", \n", @req)))->execute (); 

my $set = $dbh->prepare ("INSERT INTO timings (" . join (', ', @head) . ") VALUES (" . join (', ', ('?') x scalar (@head)) . ")");

while (my @line = &line ($fh))
  {
    $set->execute (@line);
  }


__END__


my %opts;

sub drHook2SQLite
{
  my ($f, $dbh) = @_;

  my @line = do { my $fh = 'FileHandle'->new ("<$f"); <$fh> };
  shift (@line) for (1 .. 6);
  my ($Wall_main, $Task, $Procs, $Threads) = (shift (@line) =~ m/Wall-time is\s+(\S+) sec on proc#(\d+) \((\d+) procs, (\d+) threads\)/o);
  
  my @Wall_threads;
  for (1 .. $Threads)
    {
      push @Wall_threads, (shift (@line) =~ m/Thread#\d+:\s+(\S+) sec/o);
    }

  while (@line)
   {
     last if ($line[0] =~ m/\(self\)\s+\(sec\)\s+\(sec\)\s+\(sec\)\s+ms\/call\s+ms\/call/o);
     shift (@line);
   }
  shift (@line) for (1 .. 2);


  my $set = $dbh->prepare ("INSERT INTO DrHookTime (Rank, Time, Cumul, Self, Total, "
                         . "Calls, SelfPerCall, TotalPerCall, Name, Thread, Task) "
                         . "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

  for my $line (@line)
    {
      chomp ($line);

      $line =~ s/^\s*(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+//go;
      my ($Rank, $Time, $Cumul, $Self, $Total, $Calls, $SelfPerCall, $TotalPerCall) = ($1, $2, $3, $4, $5, $6, $7, $8);


      $line =~ s/^\*//o;
      my ($Name, $Thread);

      unless (($Name, $Thread) = ($line =~ m/^(.*)\@(\d+)$/o))
        {
          ($Name, $Thread) = ($line, 1);
        }

      if ($opts{only})
        {
          next unless (grep { $Name eq $_ } @{ $opts{only} });
        }

      $set->execute ($Rank, $Time, $Cumul, $Self, $Total, $Calls, $SelfPerCall, $TotalPerCall, $Name, $Thread, $Task);
    }

}

my @opts_s = qw (only);

&GetOptions
(
  map ({ ("$_=s", \$opts{$_}) } @opts_s),
);

if ($opts{only})
  {
    $opts{only} = [split (m/,/o, $opts{only})];
  }


my $db = shift;

die unless ($db);

my @drhook;

if ((scalar (@ARGV) == 1) && (-d $ARGV[0]))
  {
    @drhook = <$ARGV[0]/drhook.prof.*>;
  }
else
  {
    @drhook = @ARGV;
  }
  
unlink ($db);

my $dbh = 'DBI'->connect ("DBI:SQLite:$db", '', '', {RaiseError => 1})
  or die ($DBI::errstr);
$dbh->{RaiseError} = 1;

$dbh->prepare (<< "EOF")->execute (); 
CREATE TABLE DrHookTime 
   (Rank            INT           NOT NULL, 
    Time            FLOAT         NOT NULL,
    Cumul           FLOAT         NOT NULL,
    Self            FLOAT         NOT NULL,
    Total           FLOAT         NOT NULL,
    Calls           INT           NOT NULL,
    SelfPerCall     FLOAT         NOT NULL,
    TotalPerCall    FLOAT         NOT NULL,
    Name            VARCHAR (255) NOT NULL,
    Thread          INT           NOT NULL,
    Task            INT           NOT NULL,
    PRIMARY KEY (Name, Thread, Task))
EOF

$dbh->prepare ("BEGIN TRANSACTION")->execute ();

for my $f (@drhook)
  {
    &drHook2SQLite ($f, $dbh);
  }

$dbh->prepare ("COMMIT")->execute ();

$dbh->prepare ("CREATE INDEX DrHookTimeIdx ON DrHookTime (Name, Thread, Task);")->execute ();


# Per calls figures have too few digits

$dbh->do ("UPDATE DrHookTime SET SelfPerCall = 1000 * Self/Calls, TotalPerCall = 1000 * Total/Calls;");


