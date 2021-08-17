#!/bin/bash
#SBATCH -n 1
#SBATCH -c 4
#SBATCH -J launch_cromwell
#SBATCH --mem=16000

java -Dconfig.file=wdl/slurm.conf -jar \
/gpfs/ycga/project/lek/shared/tools/jars/cromwell-56.jar run \
/gpfs/ycga/project/ysm/lek/shared/tools/cromwell_wdl/bam_level_QC.wdl \
-i wdl/bam_level_QC_inputs_hg38.json \
-o wdl/cromwell.options
