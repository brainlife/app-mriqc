#!/usr/bin/env python3

import pandas as pd
import json
import glob

def create_dataframe(iqms,outpath):

    df = pd.DataFrame(iqms).reset_index()
    df = df.loc[df['index'] == 'modality']
    df = df.rename(columns={'index': 'modality'})

    df.to_csv(outpath,sep='\t',index=False)

def main():

    with open('config.json','r') as config_f:
        config = json.load(config_f)
    
    TYPE = config['type']

    modality = glob.glob('./output/sub-0/%s/sub-0_*.json')

    outpath = './regressors/regressors.tsv'

    with open(glob.glob('./output/sub-0/%s/sub-0_*.json' %(TYPE))[0],'r') as iqm_file:
        iqms = json.load(iqm_file)

    create_dataframe(iqms,outpath)

if __name__ == "__main__":
    main()