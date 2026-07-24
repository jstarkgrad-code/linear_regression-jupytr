#!/bin/bash
# Shared Conda initialization for this assignment.
# Source this file; do not run it directly.
#
# Usage (from the AI directory):
#   source conda_env_init.sh

MODULE_NAME="miniconda3/24.1.2-py310"
ENV_NAME="assignment2_regression"

if ! type module &>/dev/null; then
  echo "Error: the 'module' command is not available in this shell." >&2
  echo "Run this on the cluster login/compute node where Lmod is installed." >&2
  return 1 2>/dev/null || exit 1
fi

module load "$MODULE_NAME"

if ! command -v conda &>/dev/null; then
  echo "Error: conda not found after 'module load $MODULE_NAME'." >&2
  return 1 2>/dev/null || exit 1
fi

CONDA_BASE="$(conda info --base)"
if [[ -f "$CONDA_BASE/etc/profile.d/conda.sh" ]]; then
  # Required so 'conda activate' works in bash
  source "$CONDA_BASE/etc/profile.d/conda.sh"
else
  echo "Error: could not find conda.sh in $CONDA_BASE" >&2
  return 1 2>/dev/null || exit 1
fi

conda activate "$ENV_NAME"
