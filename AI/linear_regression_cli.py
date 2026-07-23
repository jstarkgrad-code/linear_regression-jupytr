#!/usr/bin/env python3
"""Fit a linear regression from the command line and plot the fitted line."""

import argparse
import sys
from pathlib import Path

import matplotlib.pyplot as plt
import pandas as pd
import statsmodels.api as sm


def parse_args():
    parser = argparse.ArgumentParser(
        description=(
            "Read a CSV from the working directory, fit a linear regression, "
            "and save/display a scatter plot with the fitted line and model statistics."
        )
    )
    parser.add_argument("csv_file", help="CSV file name in the working directory")
    parser.add_argument("predictor", help="Predictor (x) column name")
    parser.add_argument("outcome", help="Outcome (y) column name")
    return parser.parse_args()


def main():
    args = parse_args()
    csv_path = Path(args.csv_file)

    if not csv_path.is_file():
        print(
            f"Error: CSV file not found in working directory: {args.csv_file}",
            file=sys.stderr,
        )
        sys.exit(1)

    data = pd.read_csv(csv_path)

    for column in (args.predictor, args.outcome):
        if column not in data.columns:
            print(
                f"Error: column '{column}' not found in {args.csv_file}",
                file=sys.stderr,
            )
            sys.exit(1)

    x = data[args.predictor]
    y = data[args.outcome]
    design_matrix = sm.add_constant(x)
    model = sm.OLS(y, design_matrix).fit()

    fitted_y = model.predict(design_matrix)
    slope = model.params[args.predictor]
    intercept = model.params["const"]
    r_squared = model.rsquared
    mse = ((y - fitted_y) ** 2).mean()

    plt.figure(figsize=(8, 5))
    plt.scatter(x, y, color="steelblue", edgecolor="white")
    plt.plot(x, fitted_y, color="darkred", linewidth=2)
    plt.title(f"Linear Regression of {args.outcome} on {args.predictor}")
    plt.xlabel(args.predictor)
    plt.ylabel(args.outcome)
    plt.text(
        0.05,
        0.95,
        f"y = {slope:.2f}x + {intercept:.2f}\nR^2 = {r_squared:.3f}\nMSE = {mse:.2f}",
        transform=plt.gca().transAxes,
        va="top",
    )
    plt.tight_layout()
    plt.savefig("regression_plot_py.png", dpi=150)
    print("Plot saved to regression_plot_py.png")
    plt.show()


if __name__ == "__main__":
    main()
