# Linear Regression Assignment (AI Directory)

This folder contains a linear regression assignment implemented in **Python** and **R**. It includes Jupyter notebooks, HTML exports of those notebooks, command-line (CLI) scripts, sample data, and reproducible environment setup files.

All work for this assignment lives in this `AI/` directory.

## Files in this directory

| File | Description |
|------|-------------|
| `linear_regression_python.ipynb` | Python Jupyter notebook |
| `linear_regression_r.ipynb` | R Jupyter notebook |
| `linear_regression_python.html` | Static HTML export of the Python notebook |
| `linear_regression_r.html` | Static HTML export of the R notebook |
| `linear_regression_cli.py` | Python CLI script |
| `linear_regression_cli.R` | R CLI script |
| `regression_data.csv` | Sample dataset |
| `environment.yml` | Conda environment definition |
| `setup_env.sh` | One-time environment setup |
| `activate_env.sh` | Activate the environment in your current shell |
| `use_env.sh` | Run a single command inside the environment |
| `start_jupyter.sh` | Launch JupyterLab in the environment |
| `conda_env_init.sh` | Shared Conda/module initialization (sourced by other scripts) |
| `AI_prompts_log.md` | Log of prompts used to create this assignment |

## Dataset

`regression_data.csv` contains employee salary data:

| Column | Role |
|--------|------|
| `YearsExperience` | Predictor (x) |
| `Salary` | Outcome (y) |

The notebooks use these columns by default. The CLI scripts accept any column names you pass as arguments.

## Environment setup (required)

The notebooks and Python CLI script need packages installed in a Conda environment named **`assignment2_regression`** (pandas, matplotlib, statsmodels, ggplot2, etc.). The cluster’s default Python does **not** include these packages.

### One-time setup

From this directory:

```bash
cd AI
bash setup_env.sh
```

### Activate before running Python or Jupyter

**You must activate the environment in each new terminal session** before running notebooks or scripts. If you skip this step, you may see errors like `ModuleNotFoundError: No module named 'pandas'` or `'statsmodels'`.

```bash
cd AI
source activate_env.sh
```

Important:

- Use **`source activate_env.sh`**, not `bash activate_env.sh`. Running with `bash` starts a temporary subshell and the environment will not stay active.
- On this cluster, **`conda activate` alone will not work** until the Miniconda module is loaded. The helper scripts handle that for you.

Verify you are using the correct Python:

```bash
which python
```

You should see a path containing `assignment2_regression`, for example:

```text
/users/PAS3421/stark346/.conda/envs/assignment2_regression/bin/python
```

### Run one command without activating manually

```bash
bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
bash use_env.sh Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary
bash use_env.sh jupyter lab --no-browser --port=2000
bash start_jupyter.sh
```

## Jupyter notebooks

### Python: `linear_regression_python.ipynb`

- Reads `regression_data.csv`
- Fits **Salary ~ YearsExperience** using OLS (`statsmodels`)
- Displays a scatter plot with the fitted regression line
- Annotates the plot with the regression equation, R², and MSE

**Kernel:** Python (`assignment2_regression`)

### R: `linear_regression_r.ipynb`

- Reads `regression_data.csv`
- Fits **Salary ~ YearsExperience** using `lm()`
- Displays a scatter plot with the fitted regression line (`ggplot2`)
- Annotates the plot with the regression equation, R², and MSE

**Kernel:** R (`assignment2_regression`)

### How to run the notebooks

1. Set up the environment (once): `bash setup_env.sh`
2. Activate the environment: `source activate_env.sh`
3. Start JupyterLab:

```bash
jupyter lab --no-browser --port=2000
```

Or use the shortcut:

```bash
bash start_jupyter.sh
```

4. Open the notebook and select the matching kernel listed above.
5. Run all cells from top to bottom.

## HTML exports

| File | Source notebook |
|------|-----------------|
| `linear_regression_python.html` | `linear_regression_python.ipynb` |
| `linear_regression_r.html` | `linear_regression_r.ipynb` |

These are static snapshots of the executed notebooks. You can open them in a web browser to view the analysis, code, and figures **without** starting Jupyter or activating the Conda environment.

Use the HTML files for:

- Quick review of notebook output
- Sharing or submitting a read-only version of the work

To regenerate an HTML export after editing a notebook (with the environment active):

```bash
jupyter nbconvert --to html linear_regression_python.ipynb
jupyter nbconvert --to html linear_regression_r.ipynb
```

## CLI scripts

Both CLI scripts perform the same regression and plotting workflow as the notebooks, but accept column names and CSV filename as **command-line arguments** instead of using hard-coded values.

### Arguments (both scripts)

1. CSV filename (must exist in the current working directory)
2. Predictor column name (x)
3. Outcome column name (y)

### Python: `linear_regression_cli.py`

```bash
python linear_regression_cli.py regression_data.csv YearsExperience Salary
```

With the environment wrapper (no manual activation):

```bash
bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
```

- **Output plot:** `regression_plot_py.png`
- **Libraries:** pandas, matplotlib, statsmodels

### R: `linear_regression_cli.R`

```bash
Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary
```

With the environment wrapper:

```bash
bash use_env.sh Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary
```

- **Output plot:** `regression_plot_R.png`
- **Libraries:** ggplot2 (base R for `lm()`)

## Output

Notebooks and CLI scripts produce:

- **Scatter plot** with fitted regression line
- **Title and axis labels** using the outcome and predictor names
- **On-plot annotation:** regression equation (`y = mx + b`), R², and MSE

CLI scripts save PNG files to the current working directory and print a confirmation message.

## Troubleshooting

| Error | Likely cause | Fix |
|-------|--------------|-----|
| `No module named 'pandas'` or `'statsmodels'` | Environment not activated | `source activate_env.sh` or use `bash use_env.sh ...` |
| Environment does not stay active | Used `bash activate_env.sh` | Use `source activate_env.sh` instead |
| `conda activate` fails | Miniconda module not loaded | Use the provided helper scripts |
| CSV or column not found | Wrong working directory or column name | Run from `AI/` and check `regression_data.csv` column names |
