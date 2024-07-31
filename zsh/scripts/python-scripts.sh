#!/bin/bash

current_dir="${HOME}/my-configs/python"

# Loop over all subdirectories
for dir in $(find $current_dir -maxdepth 1 -type d)
do
    dir_name=$(basename $dir)

    # Skip the current directory
    if [ "$dir_name" = "." ] || [ "$dir_name" = "python" ]
    then
        continue
    fi

    command_to_alias="py ${dir}/main.py"
    alias_name=$dir_name

    eval alias $alias_name="'$command_to_alias'"
done
