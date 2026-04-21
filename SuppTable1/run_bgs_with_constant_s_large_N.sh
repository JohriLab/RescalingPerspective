#!/bin/bash
#SBATCH --mail-user=pjohri@unc.edu
#SBATCH --mail-type=ALL
#SBATCH -p general
#SBATCH -n 1 #number of tasks
#SBATCH --time=5-0:00
#SBATCH --mem=10g
#SBATCH -a 1-10%10
#SBATCH -o /nas/longleaf/home/pjohri/LOGFILES/bgs_rescaling_largeN_%A_rep%a.out
#SBATCH -e /nas/longleaf/home/pjohri/LOGFILES/bgs_rescaling_largeN_%A_rep%a.err

echo "SLURM_JOBID: " $SLURM_JOBID
echo "SLURM_ARRAY_TASK_ID: " $SLURM_ARRAY_TASK_ID
echo "SLURM_ARRAY_JOB_ID: " $SLURM_ARRAY_JOB_ID
######################################
#To be run on LONGLEAF!
#100 simulations per submitted job!
#######################################
#80 hours for C=1000, 10g
#80 hours for C=500, 10g
#5 days for C=200, 10g
#5 days for C=100, 10g 

declare -i repID=0+$SLURM_ARRAY_TASK_ID

module load slim

cd /nas/longleaf/home/pjohri/RescaleReview

echo "starting simulation " $repID

scaling_factor=100
folder="/work/users/p/j/pjohri/RescaleReview/bgs_sims_large_N/C_${scaling_factor}"

if [ ! -f "${folder}/output${repID}.txt" ]
then
        slim -d d_seed=${repID} -d d_scale=${scaling_factor} -d d_L=1e6 -d "d_folder='${folder}'" -d "d_repID='${repID}'" bgs_with_constant_s_large_N.slim
fi


