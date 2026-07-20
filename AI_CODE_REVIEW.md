AI_CODE_REVIEW

**PR #1 (`assignment3`) and PR #2 (`assignment3-AI`) both add slope-intercept + R² on the plots, but they touch different folders and use different quality levels for “works with any CSV.”**

### Quick identity
| | [PR #1](https://github.com/jstarkgrad-code/linear_regression-jupytr/pull/1) | [PR #2](https://github.com/jstarkgrad-code/linear_regression-jupytr/pull/2) |
|--|--|--|
| Branch | `assignment3` → `main` | `assignment3-AI` → `main` |
| Scope | `manual/` folder | `AI/` folder |
| Size | ~493 additions / 1063 deletions, 8 files | ~1536 additions / 65 deletions, 9 files |
| Status | Merged | Merged |

---

### What each PR changed

**PR #1 (`manual/`)**  
- Added equation + R² to Python/R notebooks, HTML exports, and scripts  
- Notebook Python text often **hard-coded** at `(2.7, 40000)`  
- CLI R script used **corner placement** (`x = -Inf, y = Inf`)  
- CLI Python used **axes fractions** (`transAxes`) in your later work path  
- Lots of HTML churn (re-exported notebooks, deleted old cells/outputs)  
- No new README in that PR

**PR #2 (`AI/`)**  
- Same annotation goal in the AI copies of scripts/notebooks/HTML  
- Python: `plt.text(0.02, 0.98, ..., transform=plt.gca().transAxes, ...)`  
- R: `annotate("text", x = -Inf, y = Inf, ...)`  
- Added a full **`AI/README.md`** (how to run, env, outputs, example stats)  
- Cleaner separation: build `formula_text` / `r2_text`, then place them  
- Uses `y`/`x` notation and `R²` consistently  
- Also re-exported HTML with executed outputs

---

### Side-by-side: annotation approach

| Topic | PR #1 `manual` | PR #2 `AI` |
|--|--|--|
| Python position | Mixed: notebooks often hard-coded `(2.7, 40000)`; CLI more flexible | Consistently **axes-relative** top-left |
| R position | CLI: corner (`-Inf`/`Inf`); notebook had hard-coded earlier | Consistently corner annotate |
| CSV-agnostic labels | Partial (CLI better than notebooks) | Stronger / more consistent |
| Documentation | Light (markdown in notebooks) | Strong (`AI/README.md`) |
| Model stack | sklearn `LinearRegression` in manual Python | statsmodels OLS in AI Python |

---

### Bottom line
- **Same assignment goal:** show \(y = mx + b\) and R² on the plot.  
- **PR #1** = your manual/learning path (some hard-coding left in notebooks).  
- **PR #2** = AI-folder version with more consistent flexible placement + a proper README.  

They are **not duplicates of the same files** — they update parallel `manual/` vs `AI/` trees.

If you want a deeper dive next, I can compare just one pair (e.g. `manual/linear_regression_python.py` vs `AI/linear_regression_cli.py`) line-by-line for differences a grader would notice.

---

My comment: I used two different ways to choose the location of my graph annotations. In the notebooks, I hard coded the location based on the axes. The AI used all axes-relative locations for the location of the string, which I think is more user friendly. 
