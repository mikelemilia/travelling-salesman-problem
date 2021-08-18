#!/bin/bash

# Local variable
#SOLVER=("comp" "iter" "math" "heur" "tabu" "gene")
GENETIC=("gen1" "gen2" "gen3" "gen4")
SOLVER=("comp")

# Move into build folder
for solver in "${SOLVER[@]}"; do

  if [ "$solver" == "comp" ]; then
    for m in {1..8}; do
      sbatch "$solver"-tsp.slurm -m $m
    done

  elif [ "$solver" == "iter" ]; then
    sbatch "$solver"-tsp.slurm

  elif [ "$solver" == "math" ]; then
    sbatch "$solver"-tsp.slurm

  elif [ "$solver" == "heur" ]; then
    sbatch "$solver"-tsp.slurm

  elif [ "$solver" == "tabu" ]; then
    sbatch "$solver"-tsp.slurm

  elif [ "$solver" == "gene" ]; then
    for genetic in "${GENETIC[@]}"; do
      sbatch "$genetic"-tsp.slurm
    done

  else
    echo "Solver not found"

  fi
done
