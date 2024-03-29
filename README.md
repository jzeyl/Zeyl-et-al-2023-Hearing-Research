# Workflow
This repository documents the statistics used for the following research paper:

Zeyl et al., "Scaling of ear morphology across 127 bird species and its implications for hearing performance", Hearing Research (2023), [https://doi.org/10.1016/j.heares.2022.108679](https://doi.org/10.1016/j.heares.2022.108679) [![DOI](https://zenodo.org/badge/376639292.svg)](https://zenodo.org/badge/latestdoi/376639292)

## **To reproduce the the scaling pgls analyses:**

Start with _**"Set up data_scl.R".**_ This loads the data and phylogeny. This also runs the phylogenetic regressions (phylogenetic generalized least squares regressions, or PGLS) between ear measures and between each ear measure and head mass. This script also exports the summary statistics and tables to csv or word files.

## **To run the pgls between ear structures and audiometric measurements:**  

First,  _**"Set up data_scl.R"**_ also has to be run (up to line 70) to get the data prepared. Next, the scripts in _**"Audiograms linked to anatomy.R"**_ can be run to create a  dataframe ('limits') containing the audiogram metrics which will be joined with the morphological data.  Once the dataframe is created is created, _**"pgls_resids re headmass.R"**_ can be used to run the pgls analyses with head mass-corrected values. Note that for running analyses at different cut-off levels (35 or 60 dB), the cutoff is specified in the 'Audiograms linked to anatomy.R' file. When switching cut-off levels it is recommended to to empty the environment, modify the cut-off level, and re-rerun all relevant scripts with updated cut-off 

<br>


## Data files
|File|Description|
|-----|-----|
|["databmadded.csv"](https://github.com/jzeyl/Scaling_2021/blob/main/databmadded.csv)|Anatomical data|
|["Column name descriptions.csv"](https://github.com/jzeyl/Scaling_2021/blob/main/Column%20name%20descriptions.csv)|File describing the column names in data files|
|["audiograms.csv"](https://github.com/jzeyl/Scaling_2021/blob/main/audiograms.csv)|Audiogram threshold data collected from literature|
|["JZ tree Prum merged hackett.tree"](https://github.com/jzeyl/Scaling_2021/blob/main/JZ%20tree%20Prum%20merged%20hackett.tree)|Phylogeny file|

<br>

## Scaling analyses

|File|Description|
|-----|-----|
|["Set up data_scl.R"](https://github.com/jzeyl/Scaling_2021/blob/main/Set%20up%20data_scl.R)|This is the main analysis script, which imports the data analysis and runs pgls regressions, calling formulas from other R scripts (below). Outputs are tables with statistical results exported to csv or word.|
|["pgls_intraear.R"](https://github.com/jzeyl/Scaling_2022/blob/main/pgls_intraear.R)|Runs pgls regressions between auditory structures|
|["pgls_HM.R"](https://github.com/jzeyl/Scaling_2022/blob/main/pgls_HM.R)|Runs pgls regressions pgls models against head mass|
|["pgls_bm.R"](https://github.com/jzeyl/Scaling_2022/blob/main/pgls_bm.R)|Runs pgls regressions pgls models against body mass|  
<br>

## Audiometry analyses

|File|Description|
|-----|-----|
|["Audiograms linked to anatomy.R"](https://github.com/jzeyl/Scaling_2022/blob/main/Audiograms%20linked%20to%20anatomy.R)|This is the main analysis script for pgls analyses between anatomy and audiogram metrics, which calls other scripts (below). Outputs are tables with statistical results exported to csv or word.|
|["pgls_audiogram_bs.R"](https://github.com/jzeyl/Scaling_2021/blob/main/pgls_audiogram_bs.R)|Runs pgls models to predict best sensitivity|
|["pgls_audiogram_hf.R"](https://github.com/jzeyl/Scaling_2021/blob/main/pgls_audiogram_hf.R)|Runs pgls models to predict high frequency limit|
|["pgls_audiogram_lf.R"](https://github.com/jzeyl/Scaling_2021/blob/main/pgls_audiogram_lf.R)|Runs pgls models to predict low frequency limit|
|["pgls_audiogram_bh.R"](https://github.com/jzeyl/Scaling_2021/blob/main/pgls_audiogram_hf.R)|Runs pgls models to predict best frequency| 
|["pgls_resids re headmass.R"](https://github.com/jzeyl/Scaling_2021/blob/main/pgls_resids%20re%20headmass.R)|Runs the pgls analyses with head mass-corrected values|

# Plots
R scripts for reproducing plots are in the 'plots' folder. The associated analysis files (if applicable) must be run before the associated plotting scripts.    
                      



