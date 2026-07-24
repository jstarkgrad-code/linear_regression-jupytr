# Linear Regression Assignment (Jupyter & CLI)

This README was written by the AI agent.

This repository contains a linear regression assignment implemented in **Python** and **R**. It includes Jupyter notebooks, HTML exports, command-line scripts, sample data, and reproducible environment setup files.

## Repository layout

```text
AI/
├── linear_regression_python.ipynb   # Python Jupyter notebook
├── linear_regression_r.ipynb        # R Jupyter notebook
├── linear_regression_python.html    # HTML export of Python notebook
├── linear_regression_r.html         # HTML export of R notebook
├── linear_regression_cli.py         # Python CLI script
├── linear_regression_cli.R          # R CLI script
├── regression_data.csv              # Sample dataset
├── environment.yml                  # Conda environment definition
├── setup_env.sh                     # One-time environment setup
├── activate_env.sh                  # Activate env in current shell
├── use_env.sh                       # Run a command inside the env
├── start_jupyter.sh                 # Launch JupyterLab
└── conda_env_init.sh                # Shared Conda initialization
```

## Dataset

The sample CSV file (`AI/regression_data.csv`) contains:

| Column | Role |
|--------|------|
| `YearsExperience` | Predictor (x) |
| `Salary` | Outcome (y) |

## Environment setup (cluster)

From the `AI/` directory:

```bash
cd AI
bash setup_env.sh
```

After setup, activate the environment in each new terminal:

```bash
source activate_env.sh
```

**Note:** On this cluster, `conda activate` alone will not work until the Miniconda module is loaded. Use `source activate_env.sh` or the wrapper scripts below.

### Shortcut commands

Run a single command without manually activating:

```bash
bash use_env.sh jupyter lab --no-browser --port=2000
bash start_jupyter.sh
```

## Jupyter notebooks

1. Set up and activate the environment (see above).
2. Start JupyterLab:

```bash
jupyter lab --no-browser --port=2000
```

3. Open a notebook and select the matching kernel:
   - **Python (assignment2_regression)** for the Python notebook
   - **R (assignment2_regression)** for the R notebook

Each notebook reads the CSV, fits a linear regression model, prints R² and p-values, and displays a scatter plot with the fitted regression line.

## CLI scripts

Both CLI scripts take three arguments:

1. CSV filename (must be in the current working directory)
2. Predictor column name (x)
3. Outcome column name (y)

### Python

```bash
python linear_regression_cli.py regression_data.csv YearsExperience Salary
```

Saves plot to `regression_plot_py.png`.

### R

```bash
Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary
```

Saves plot to `regression_plot_R.png`.

### Example with environment wrapper

```bash
bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
bash use_env.sh Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary
```

## Output

Both notebooks and CLI scripts produce:

- **Printed statistics:** R², p-value (Intercept), p-value (predictor)
- **Plot:** scatter plot with fitted regression line, titled using the outcome and predictor names
