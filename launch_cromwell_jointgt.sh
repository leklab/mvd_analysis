#!/bin/bash
#SBATCH -n 1
#SBATCH -c 4
#SBATCH -J launch_cromwell
#SBATCH --mem=16000

java -Dconfig.file=wdl/slurm.conf -jar \
/gpfs/ycga/project/lek/shared/tools/jars/cromwell-56.jar run \
wdl/Multisample_jointgt_GATK4.wdl \
-i wdl/Multisample_jointgt_GATK4_inputs_hg38.json \
-o wdl/cromwell.options
