#!/bin/bash
# Activate the assignment Conda environment in your CURRENT shell.
#
# IMPORTANT: you must SOURCE this file (not run it with bash):
#   source activate_env.sh
#
# After sourcing, your prompt shell will have conda and the environment active.

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  cat <<'EOF'

ERROR: You ran this script with 'bash activate_env.sh'.
That starts a temporary subshell, so the environment will NOT stay active.

Use this instead (note the word 'source'):
  cd /users/PAS3421/stark346/assignment2/AI
  source activate_env.sh

Or run commands without activating manually:
  bash use_env.sh jupyter lab --no-browser --port=2000
  bash use_env.sh python linear_regression_cli.py regression_data.csv YearsExperience Salary

EOF
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=conda_env_init.sh
source "$SCRIPT_DIR/conda_env_init.sh" || return 1

echo "Activated environment: $ENV_NAME"
echo "You can now run: jupyter lab --no-browser --port=2000"
