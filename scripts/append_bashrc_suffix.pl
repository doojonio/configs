#!/usr/bin/env perl

use strict;
use warnings;
use v5.30;

use Mojo::File;

my $bashrc = Mojo::File->new($ENV{HOME}.'/.bashrc') or die;
my $suffix = Mojo::File::curfile->dirname->sibling('bashrc_suffix') or die;

my $bashrc_content = $bashrc->slurp;
my $suffix_content = $suffix->slurp;

if ($bashrc_content !~ /\Q$suffix_content/) {
  $bashrc_content .= $suffix_content;
}

$bashrc->spurt($bashrc_content);
