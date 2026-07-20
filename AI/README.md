# Linear Regression — Assignment 2 (AI Folder)

This folder contains Jupyter notebooks, command-line (CLI) scripts, and supporting files for fitting a simple linear regression model to employee salary data. Each analysis reads `regression_data.csv`, fits **Salary ~ YearsExperience**, prints model statistics, and saves a scatter plot with the fitted regression line.

The plot includes a slope-intercept formula and **R²** annotation in the **top-left corner inside the figure**, using generic **`y`** and **`x`** notation (for example, `y = 8285.29x + 29203.52`).

---

## Files

| File | Description |
|------|-------------|
| `regression_data.csv` | Input data: `YearsExperience` (predictor) and `Salary` (outcome) |
| `linear_regression_python.ipynb` | Python notebook (pandas, statsmodels, matplotlib) |
| `linear_regression_r.ipynb` | R notebook (ggplot2, base `lm()`) |
| `linear_regression_python.html` | Static HTML export of the Python notebook |
| `linear_regression_r.html` | Static HTML export of the R notebook |
| `linear_regression_cli.py` | Python CLI script (accepts CSV, predictor, and outcome column names) |
| `linear_regression_cli.R` | R CLI script (same interface as the Python CLI) |
| `environment.yml` | Conda environment definition |
| `setup_env.sh` | One-time environment setup script |
| `activate_env.sh` | Activate the Conda environment in a new terminal |
| `use_env.sh` | Run any command inside the assignment environment |
| `start_jupyter.sh` | Launch JupyterLab on port 2000 |
| `AI_prompts_log.md` | Log of prompts used during development |

---

## Environment setup

From this directory, run:

```bash
bash setup_env.sh
```

Then activate the environment in each new terminal session:

```bash
source activate_env.sh
```

Alternatively, run a single command inside the environment without activating manually:

```bash
bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
```

---

## Running the notebooks

### JupyterLab

```bash
bash start_jupyter.sh
```

Open `linear_regression_python.ipynb` or `linear_regression_r.ipynb` in the browser.

### Static HTML (no Jupyter required)

Open these files in a web browser:

- `linear_regression_python.html`
- `linear_regression_r.html`

---

## Running the CLI scripts

Both scripts take three arguments: **CSV file name**, **predictor column**, and **outcome column**.

### Python

```bash
bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
```

Saves: `regression_plot_py.png`

### R

```bash
bash use_env.sh Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary
```

Saves: `regression_plot_R.png`

---

## Output

### Printed to the terminal

- **R²** (coefficient of determination)
- **p-value** for the intercept
- **p-value** for the predictor

### On the plot

- Scatter points (observed data)
- Fitted regression line
- Title and axis labels using the outcome and predictor column names
- Top-left annotation:
  - Slope-intercept formula in **y = mx + b** form (e.g. `y = 8285.29x + 29203.52`)
  - **R²** value (e.g. `R² = 0.7852`)

---

## Example results (`regression_data.csv`)

With the default columns `YearsExperience` and `Salary`:

| Statistic | Value |
|-----------|-------|
| R² | 0.7852 |
| p-value (Intercept) | 9.8450e-05 |
| p-value (YearsExperience) | 6.4065e-04 |
| Formula (on plot) | `y = 8285.29x + 29203.52` |

---

## Re-exporting notebook HTML

After editing a notebook, regenerate the HTML files from this directory:

```bash
bash use_env.sh jupyter nbconvert --to html linear_regression_python.ipynb linear_regression_r.ipynb --output-dir .
```

To execute notebooks and embed outputs in the HTML:

```bash
bash use_env.sh jupyter nbconvert --to html --execute linear_regression_python.ipynb --output-dir .
bash use_env.sh jupyter nbconvert --to html --execute linear_regression_r.ipynb --ExecutePreprocessor.kernel_name=ir --output-dir .
```

---

## Dependencies

Defined in `environment.yml`:

- **Python:** pandas, matplotlib, statsmodels, JupyterLab, ipykernel
- **R:** r-base, r-ggplot2, r-irkernel
