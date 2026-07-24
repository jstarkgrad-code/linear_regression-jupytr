#!/bin/bash
# Start JupyterLab using the assignment environment.
# Run with: bash start_jupyter.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec bash "$SCRIPT_DIR/use_env.sh" jupyter lab --no-browser --port=2000
