## running our example 
python ~/hpc_example.py -t 10 -l 100


## submit our first job
bsub "python ~/hpc_example.py -t 60 -l 100"


## Getting some information about our job
bsub -o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 100"


## Creating a larger list in our example program
bsub -o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 200000"


## Raising the memory limit of our job
bsub -M 20000 \
-o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 200000"


## Setting a memory limit, and reserving the resources
bsub -M 20000 \
-R "rusage[mem=20]" \
-o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 200000"


## Reserving a really large amount of memory
bsub -M 20000 \
-R "rusage[mem=14000]" \
-o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 200000"


## submitting an interactive job
bsub -M 20000 -Is "sh"


## using job names and dependencies
bsub -J "job_part1" \
-o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 200"
bsub -J "job_part2" -w "done(job_part1)" \
-o "output.txt" \
-f "output.txt < output.txt" \
"python ~/hpc_example.py -t 60 -l 200"