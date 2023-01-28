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


