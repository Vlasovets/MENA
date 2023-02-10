#!/bin/bash

#SBATCH --time=1-00:00:00
#SBATCH -A ibex-cs
#SBATCH -J import
#SBATCH --mem=32G
#SBATCH -c 16
#SBATCH -o qiime.2022.11.%J.out
#SBATCH -e qiime.2022.11.%J.out

module load qiime/2.0/qiime2-2022.11

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path  manifest.tsv \
  --input-format PairedEndFastqManifestPhred33V2 \
  --output-path paired-end-demux.qza
