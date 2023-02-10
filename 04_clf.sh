#!/bin/bash

#SBATCH --time=1-00:00:00
#SBATCH -A ibex-cs
#SBATCH -J clf
#SBATCH --mem=32G
#SBATCH -c 16
#SBATCH -o qiime.2022.11.%J.out
#SBATCH -e qiime.2022.11.%J.out

module load qiime/2.0/qiime2-2022.11




qiime feature-classifier classify-sklearn \
    --i-classifier rescript/silva-138-ssu-nr99-classifier.qza \
    --i-reads DADA2_denoising_output/representative_sequences.qza \
    --output-dir SAUDI_rescript_classified_sequences

