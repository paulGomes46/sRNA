#!/bin/bash

#BSUB -e %J.err
#BSUB -o %J.out
#BSUB -n 24
#BSUB -R span[hosts=1]
#BSUB -J hzao mirna

source /gss1/env/Perl-5.28-BioPerl-1.7.7.env
export PATH=/gss1/home/hzhao/paul/rna_seq/tools/fasta-35.4.12/bin/:$PATH

seqs=()
database=SWO.v2.0.cDNA.fa

for seq in ${seqs[@]} ; do
	perl targetfinder.pl -s "${seq}" -d "${database}" -q "${seq}" -p 'table' >> results_mirna.txt
done


