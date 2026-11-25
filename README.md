<h1 align="center">MRIQC</h1>

<p align="center">
  Image quality metrics, an individual HTML report and a table of metrics for a T1-weighted, T2-weighted or functional (BOLD) image.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/bl.app.52"><img src="https://img.shields.io/badge/Brainlife-bl.app.52-blue.svg" alt="Run on brainlife.io"></a>
  <a href="https://github.com/brainlife/app-mriqc/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> ⚠️ **This branch, `0.14.2`, is the deprecated brainlife.io App MRIQC** ([doi:10.25663/bl.app.52](https://doi.org/10.25663/bl.app.52)). It is kept so earlier results stay reproducible. Use **Run MRIQC on Structural Data - T1w** ([doi:10.25663/brainlife.app.701](https://doi.org/10.25663/brainlife.app.701)) instead. The other Apps in this repository are listed under **Versions on brainlife.io** below.

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Runs MRIQC pipeline (http://mriqc.readthedocs.io/en/stable/reports/smri.html) from Poldrack Lab on selected T1 anatomy.**

| | |
|---|---|
| 📥 **Inputs** | `neuro/anat/t1w` |
| 📤 **Outputs** | `raw` |
| 🐳 **Container** | `poldracklab/mriqc:0.14.2` |
| ⚙️ **Resources** | 8 CPUs · 24 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/bl.app.52](https://doi.org/10.25663/bl.app.52) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` | yes |  |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `raw` |  |

<!-- brainlife-app:end -->

## 🏷️ Versions on brainlife.io

One App per input datatype, built from a branch of this repository.

| App | Input | MRIQC | Branch | Run it | Status |
|---|---|---|---|---|---|
| Run MRIQC on Functional Data - FMRI | `neuro/func/task` | 22.0.6 | [`22.0.6`](https://github.com/brainlife/app-mriqc/tree/22.0.6) | [doi:10.25663/brainlife.app.703](https://doi.org/10.25663/brainlife.app.703) | current |
| Run MRIQC on Structural Data - T1w | `neuro/anat/t1w` | 22.0.6 | [`22.0.6`](https://github.com/brainlife/app-mriqc/tree/22.0.6) | [doi:10.25663/brainlife.app.701](https://doi.org/10.25663/brainlife.app.701) | current |
| Run MRIQC on Structural Data - T2w | `neuro/anat/t2w` | 22.0.6 | [`22.0.6`](https://github.com/brainlife/app-mriqc/tree/22.0.6) | [doi:10.25663/brainlife.app.702](https://doi.org/10.25663/brainlife.app.702) | current |
| **MRIQC** (this branch) | `neuro/anat/t1w` | 0.14.2 | [`0.14.2`](https://github.com/brainlife/app-mriqc/tree/0.14.2) | [doi:10.25663/bl.app.52](https://doi.org/10.25663/bl.app.52) | deprecated |

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App for your datatype from the table above, choose the image from your project and press **Execute**. The App wraps the image into a single-subject BIDS dataset and runs [MRIQC](https://mriqc.readthedocs.io) 22.0.6 at the participant level (there is no group-level stage). It outputs:

- the full MRIQC output directory (`raw`, tagged `mriqc`);
- the MRIQC individual HTML report (`report/html`);
- a TSV of the image quality metrics (IQMs) (`neuro/regressors`), for use as regressors or for screening scans.

Use it to screen data quality before preprocessing. The `type` option (`anat` or `func`) is fixed for each App.

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). MRIQC and the Python step that builds the regressors table run inside containers.

1. Clone this repository and check out the branch brainlife.io runs: `git checkout 22.0.6`.
2. Create `config.json` with the path to your image and the BIDS folder to use (`anat` for T1w/T2w, `func` for BOLD):

   ```json
   {
       "input": "input/t1/t1.nii.gz",
       "type": "anat"
   }
   ```

   The modality is inferred from the input path, which must contain `t1`, `t2` or `bold`, and the path must be relative to the App directory.

3. Run the App:

   ```bash
   ./main
   ```

## 📦 Outputs

```text
output/                    full MRIQC output (derivatives, IQM JSON, reports)
subject_html/html/         sub-0_<modality>.html, the individual report
regressors/regressors.tsv  image quality metrics as a table
product.json               IQMs shown on brainlife.io
```

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- MRIQC. brainlife.io App. [doi:10.25663/bl.app.52](https://doi.org/10.25663/bl.app.52)
- Esteban et al. MRIQC: Advancing the automatic prediction of image quality in MRI from unseen sites. *PLOS ONE* 12:e0184661 (2017). [doi:10.1371/journal.pone.0184661](https://doi.org/10.1371/journal.pone.0184661)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Soichi Hayashi
- Brad Caron

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

[MIT](https://github.com/brainlife/app-mriqc/blob/master/LICENSE). MRIQC itself is distributed under its own license.
