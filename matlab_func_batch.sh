#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l walltime=24:00:00
#PBS -l mem=16gb
#PBS -V


# Change to the submission directory
if [ "$PBS_O_WORKDIR" != "" ];then
  cd $PBS_O_WORKDIR
fi


# Run the m-file
#~/matlab -nojvm -nodisplay -r "${func}(${arg}); exit;" > matlab_${2}.out

# Start MATLAB
~/matlab -nojvm -nodisplay > matlab_${arg}.out << EOF

% Run the function
${func}(${arg});

% Exit MATLAB
exit
EOF

# Display the output
cat matlab_${arg}.out
