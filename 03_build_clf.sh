#!/bin/bash

#SBATCH --time=1-00:00:00
#SBATCH -A ibex-cs
#SBATCH -J build
#SBATCH --mem=32G
#SBATCH -c 16
#SBATCH -o qiime.2022.11.%J.out
#SBATCH -e qiime.2022.11.%J.out

module load qiime/2.0/qiime2-2022.11


#qiime rescript get-silva-data \
#    --p-version '138' \
#    --p-target 'SSURef_NR99' \
#    --p-include-species-labels \
#    --o-silva-sequences rescript/silva-138-ssu-nr99-rna-seqs.qza \
#    --o-silva-taxonomy rescript/silva-138-ssu-nr99-tax.qza

#qiime rescript reverse-transcribe \
#    --i-rna-sequences rescript/silva-138-ssu-nr99-rna-seqs.qza \
#    --o-dna-sequences rescript/silva-138-ssu-nr99-seqs.qza

#qiime rescript cull-seqs \
#    --i-sequences rescript/silva-138-ssu-nr99-seqs.qza \
#    --o-clean-sequences rescript/silva-138-ssu-nr99-seqs-cleaned.qza

#qiime rescript filter-seqs-length-by-taxon \
#    --i-sequences rescript/silva-138-ssu-nr99-seqs-cleaned.qza \
#    --i-taxonomy rescript/silva-138-ssu-nr99-tax.qza \
#    --p-labels Archaea Bacteria Eukaryota \
#    --p-min-lens 900 1200 1400 \
#    --o-filtered-seqs rescript/silva-138-ssu-nr99-seqs-filt.qza \
#    --o-discarded-seqs rescript/silva-138-ssu-nr99-seqs-discard.qza

#qiime rescript dereplicate \
#    --i-sequences rescript/silva-138-ssu-nr99-seqs-filt.qza  \
#    --i-taxa rescript/silva-138-ssu-nr99-tax.qza \
#    --p-rank-handles 'species' \
#    --p-mode 'uniq' \
#    --o-dereplicated-sequences rescript/silva-138-ssu-nr99-seqs-derep-uniq.qza \
#    --o-dereplicated-taxa rescript/silva-138-ssu-nr99-tax-derep-uniq.qza


qiime feature-classifier fit-classifier-naive-bayes \
  --i-reference-reads  rescript/silva-138-ssu-nr99-seqs-derep-uniq.qza \
  --i-reference-taxonomy rescript/silva-138-ssu-nr99-tax-derep-uniq.qza \
  --o-classifier rescript/silva-138-ssu-nr99-classifier.qza

