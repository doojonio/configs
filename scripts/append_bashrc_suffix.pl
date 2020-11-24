#!/usr/bin/env perl

use strict;
use warnings;
use v5.30;

use Mojo::File;

my $bashrc = Mojo::File->new($ENV{HOME}.'/.bashrc') or die;
my $suffix = Mojo::File::curfile->dirname->sibling('bashrc_suffix') or die;

my $bashrc_content = $bashrc->slurp;
my $suffix_content = $suffix->slurp;

my ($start_tag, $end_tag) = ('# DOOJONIO SUFFIX START', '# DOOJONIO SUFFIX END');

$bashrc_content =~ s/${start_tag}.*${end_tag}//sg;

$bashrc_content .= $start_tag . "\n";
$bashrc_content .= $suffix_content;
$bashrc_content .= "\n".$end_tag;

$bashrc->spurt($bashrc_content);
