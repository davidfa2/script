# Define the source folder path
$source_folder = "S:\test"

# Define the target S3 bucket
$s3_bucket = "ibex.assuta"

# Create a timestamp for the new folder
$timestamp = Get-Date -Format "MMddHHmm"
$target_folder = "folder_$timestamp"

# Copy files to S3 using the AWS CLI
aws s3 sync "$source_folder" "s3://$s3_bucket/$target_folder"

# Verify the copy operation succeeded
if ($LASTEXITCODE -eq 0) {
    Write-Host "Files copied successfully. Deleting original files..."
    # Delete original files
    Remove-Item "$source_folder\*" -Recurse -Force
    Write-Host "Original files deleted."
}
else {
    Write-Host "Error occurred while copying files. Original files not deleted."
}
