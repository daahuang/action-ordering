#!/bin/bash

# Change to the submission directory
cd $PBS_O_WORKDIR


# Run the m-file
#~/matlab -nojvm -nodisplay -r "${1}(${2}); exit;" > matlab_${2}.out

# Start MATLAB
~/matlab -nojvm -nodisplay > matlab_${2}.out << EOF

% Run the function
${1}(${2});

% Exit MATLAB
exit
EOF

# Display the output
cat matlab_${2}.out
