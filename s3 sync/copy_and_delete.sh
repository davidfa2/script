#!/bin/bash

# Define the source folder path
source_folder="//*****/****"

# Define the target S3 bucket
s3_bucket="your-s3-bucket"

# Create a timestamp for the new folder
timestamp=$(date +%Y%m%d%H%M%S)
target_folder="folder_$timestamp"

# Copy files to S3 using the AWS CLI
aws s3 sync "$source_folder" "s3://$s3_bucket/$target_folder"

# Verify the copy operation succeeded
if [ $? -eq 0 ]; then
  echo "Files copied successfully. Deleting original files..."
  # Delete original files
  rm -rf "$source_folder"/*
  echo "Original files deleted."
else
  echo "Error occurred while copying files. Original files not deleted."
fi
