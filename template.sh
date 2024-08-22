#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Error: Incorrect number of arguments."
    echo "Usage: $0 <contract_name> <output_file_path>"
    exit 1
fi

# Assign the first command-line argument to contract_name
contract_name="$1"

# Assign the second command-line argument to output_file
output_file="$2"

# Ensure the directory exists
output_dir=$(dirname "$output_file")
mkdir -p "$output_dir"

# Write the output to the output file
echo "//SPDX-License-Identifier: MIT" > "$output_file"
echo "" >> "$output_file"
echo "pragma solidity ^0.8.20;" >> "$output_file"
echo "contract ${contract_name} {" >> "$output_file"
echo "    // Contract body goes here" >> "$output_file"
echo "}" >> "$output_file"

echo "Solidity contract file created: $output_file"