#!/bin/bash
#SBATCH --mail-user=pjohri@unc.edu
#SBATCH --mail-type=ALL
#SBATCH -p general
#SBATCH -n 1 #number of tasks
#SBATCH --time=0-40:00
#SBATCH --mem=200m
#SBATCH -a 1-100%100
#SBATCH -o /nas/longleaf/home/pjohri/LOGFILES/bgs_rescaling_%A_rep%a.out
#SBATCH -e /nas/longleaf/home/pjohri/LOGFILES/bgs_rescaling_%A_rep%a.err

echo "SLURM_JOBID: " $SLURM_JOBID
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID
######################################
#To be run on LONGLEAF!
#100 simulations per submitted job!
#######################################
#2 hours for C=1000, 50m
#3 hours for C=500, 50m
#6 hours for C=200, 50m
#40 hours for C=100, 

declare -i repID=0+$SLURM_ARRAY_TASK_ID

module load slim

cd /nas/longleaf/home/pjohri/RescaleReview

echo "starting simulation " $repID

scaling_factor=100
folder="/work/users/p/j/pjohri/RescaleReview/bgs_sims/C_${scaling_factor}"

if [ ! -f "${folder}/output${repID}.txt" ]
then
        slim -d d_seed=${repID} -d d_scale=${scaling_factor} -d d_L=1e6 -d "d_folder='${folder}'" -d "d_repID='${repID}'" bgs_with_constant_s.slim
fi


