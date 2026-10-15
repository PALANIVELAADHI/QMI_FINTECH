#!/usr/bin/env bash
set -euo pipefail
pip install -e ".[dev]" -q
python -m pytest -q | tee results/pytest_log.txt
python scripts/rq1_equilibria.py
python scripts/rq_reduced_game.py
python scripts/rq_qaoa_depth.py
python scripts/rq_marl.py 250,2000,5000
python scripts/rq3_benchmark.py 30 qaoa
python scripts/rq2_shapley.py 30 qaoa 10000
