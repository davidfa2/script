#!/bin/bash

# Define the source folder path
source_folder="//path/to/shared/folder"

# Define the target S3 bucket
s3_bucket="your-s3-bucket"

# Create a timestamp for the new folder
timestamp=$(date +%Y%m%d%H%M%S)
target_folder="folder_$timestamp"

# Copy files to S3 using the AWS CLI
aws s3 sync --recursive "$source_folder" "s3://$s3_bucket/$target_folder"
