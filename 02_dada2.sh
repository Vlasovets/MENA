#!/bin/bash

#SBATCH --time=1-00:00:00
#SBATCH -A ibex-cs
#SBATCH -J dada2
#SBATCH --mem=32G
#SBATCH -c 16
#SBATCH -o qiime.2022.11.%J.out
#SBATCH -e qiime.2022.11.%J.out

module load qiime/2.0/qiime2-2022.11



qiime dada2 denoise-paired \
    --i-demultiplexed-seqs small_paired-end-demux.qza \
    --p-trim-left-f 5 \
    --p-trim-left-r 5 \
    --p-trunc-len-f 215 \
    --p-trunc-len-r 215 \
    --p-max-ee-f 2 \
    --p-max-ee-r 2 \
    --p-trunc-q 2 \
    --p-n-threads 0 \
    --output-dir DADA2_denoising_output
