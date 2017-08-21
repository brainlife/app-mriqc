#!/bin/bash

#allows test execution
if [ -z $SERVICE_DIR ]; then export SERVICE_DIR=`pwd`; fi

echo "clean up from previous run"
rm -f finished 
rm -f pid

mkdir -p input/sub-0/anat output

#copy input t1 under input in bids format
T1=`jq -r '.t1' config.json`
#rm -f input/sub-0/anat/sub-0_T1w.nii.gz
#ln -s $T1 input/sub-0/anat/sub-0_T1w.nii.gz (doesn't work on azure??)
cp $T1 input/sub-0/anat/sub-0_T1w.nii.gz

cat <<EOT > _run.sh
#temporary patch until latest container is published
time singularity exec docker://poldracklab/mriqc bash -c "ldconfig && /usr/local/miniconda/bin/mriqc input output participant --no-sub"

#eventually, I should just be able to 
#time singularity run docker://poldracklab/mriqc input output participant --no-sub

#check for output files
if [ -f output/reports/sub-0_T1w.html ]; then
	echo 0 > finished
else
	echo "reports directory is empty"
	echo 1 > finished
	exit 1
fi
EOT

chmod +x _run.sh
nohup ./_run.sh > stdout.log 2> stderr.log & echo $! > pid


