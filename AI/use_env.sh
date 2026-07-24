#!/bin/bash
# Run any command inside the assignment Conda environment.
# This script can be run with bash (no 'source' needed).
#
# Examples:
#   bash use_env.sh jupyter lab --no-browser --port=2000
#   bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
#   bash use_env.sh Rscript linear_regression_cli.R regression_data.csv YearsExperience Salary

set -euo pipefail

if [[ $# -lt 1 ]]; then
  cat <<'EOF'
Usage: bash use_env.sh <command> [arguments...]

Examples:
  bash use_env.sh jupyter lab --no-browser --port=2000
  bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary
EOF
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=conda_env_init.sh
source "$SCRIPT_DIR/conda_env_init.sh"

exec "$@"
