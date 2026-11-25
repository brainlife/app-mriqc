[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.0-green.svg)](https://github.com/soichih/abcd-spec)

# brainlife/MRIQC

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Runs MRIQC 22.0.6 on a functional (BOLD) image to compute image quality metrics and produce an individual HTML QC report and a table of quality metrics.**

Wraps the functional (BOLD) image into a single-subject BIDS dataset and runs MRIQC 22.0.6 at the participant level (no group-level stage). Outputs the full MRIQC derivatives, the subject HTML report and a TSV of the image quality metrics (IQMs) for use as regressors or for screening scans. Use it to screen data quality before preprocessing.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.703](https://doi.org/10.25663/brainlife.app.703)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `func` | `neuro/func/task` | yes | Functional (BOLD) image to evaluate. |

| Output | Datatype | Description |
|---|---|---|
| `output` | `raw` | Full MRIQC output directory (derivatives, IQM JSON and reports). |
| `subject_html` | `report/html` | MRIQC individual HTML report for the input image. |
| `regressors` | `neuro/regressors` | TSV table (regressors.tsv) of the image quality metrics computed by MRIQC. |

| Parameter | Type | Default | Description |
|---|---|---|---|
| `type` | string | `func` | BIDS data folder MRIQC is run on ('func'); fixed for this App and not meant to be changed. |

Runtime: container `nipreps/mriqc:22.0.6`; 4 CPUs; 6 h walltime.

<!-- brainlife-app:end -->

This service runs [MRIQC](https://poldracklab.github.io/mriqc/) on selected T1 anatomy

## Dependency

* jq (npm install jq -g)
