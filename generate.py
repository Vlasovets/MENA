import shutil
import os
import re
import gzip
import pandas as pd
import sys

forwarded_path = os.path.abspath("/ibex/scratch/projects/ibex_cs_temp/proj8/R1/")
reversed_path = os.path.abspath("/ibex/scratch/projects/ibex_cs_temp/proj8/R2/")
# os.mkdir(reversed_path)
f_dir, r_dir = [], []
f_ID, r_ID = [], []

for __path__ in [forwarded_path, reversed_path]:
    for dir_path, _ , files in os.walk(__path__):
                
        for __file__ in files:
            file_path = os.path.join(dir_path, __file__)
                    
            if __path__ in forwarded_path:
                f_dir.append(dir_path + "/" + __file__)
                f_ID.append(__file__[:-21]) #_R1_001.fastq
                
            if __path__ in reversed_path:
                r_dir.append(dir_path + "/" + __file__)
                r_ID.append(__file__[:-21]) # _R2_001.fastq
f_df = pd.DataFrame(list(zip(f_ID, f_dir)), columns =['sample-id', "forward-absolute-filepath"])
r_df = pd.DataFrame(list(zip(r_ID, r_dir)), columns =['sample-id', "reverse-absolute-filepath"])


manifest = pd.merge(f_df, r_df, on="sample-id")
print(manifest)
manifest.to_csv('manifest.tsv', index=False, sep='\t')
