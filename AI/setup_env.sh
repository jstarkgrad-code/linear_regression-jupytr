#!/bin/bash
set -euo pipefail

# One-time (or occasional) setup for notebooks and CLI scripts.
# Run with:
#   bash setup_env.sh
#
# After setup, activate the environment in each NEW terminal with:
#   source activate_env.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# shellcheck source=conda_env_init.sh
source "$SCRIPT_DIR/conda_env_init.sh"

echo "Setting up Conda environment: $ENV_NAME"

if conda env list | awk '{print $1}' | grep -qx "$ENV_NAME"; then
  conda env update -f environment.yml --prune
else
  conda env create -f environment.yml
fi

conda activate "$ENV_NAME"

python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python ($ENV_NAME)"
Rscript -e "IRkernel::installspec(name=\"ir_${ENV_NAME}\", displayname=\"R ($ENV_NAME)\")"

cat <<EOF

Environment '$ENV_NAME' is ready.

----------------------------------------------------------------------
DO NOT run this command (it will fail on the cluster):
  conda activate $ENV_NAME

Instead, choose ONE of these options:

OPTION A - Activate for your current terminal session:
  cd $SCRIPT_DIR
  source activate_env.sh

OPTION B - Run a single command without activating manually:
  cd $SCRIPT_DIR
  bash use_env.sh jupyter lab --no-browser --port=2000
  bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary

OPTION C - Start JupyterLab with one command:
  cd $SCRIPT_DIR
  bash start_jupyter.sh
----------------------------------------------------------------------

EOF
