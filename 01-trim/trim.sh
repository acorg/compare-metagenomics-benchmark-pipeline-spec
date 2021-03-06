#!/bin/bash -e

#SBATCH -J trim
#SBATCH -A DSMITH-BIOCLOUD
#SBATCH -o slurm-%A.out
#SBATCH -p biocloud-normal
#SBATCH --time=05:00:00

. /home/tcj25/.virtualenvs/35/bin/activate

task=$1
fastq=../$task.fastq.gz
log=../$task.log
out=$task-trimmed.fastq.gz

echo "01-trim on task $task started at `date`" >> $log
echo "  fastq is $fastq" >> $log

srun -n 1 AdapterRemoval \
  --basename $task \
  --file1 $fastq \
  --output1 $out \
  --gzip \
  --trimns \
  --trimqualities

echo "01-trim on task $task stopped at `date`" >> $log
echo >> $log
