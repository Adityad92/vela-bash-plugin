#!/usr/bin/env bash
########################################################
## Script       :: vela-s3-upload-plugin.sh           ##
## Description  :: main script to execute all CICD    ##
## Author       :: Aditya Kalburgi                    ##
## Date         :: 10/10/2023                         ##
## Version      :: 1.0                                ##
########################################################

set -a
TERM=xterm
set +a

## function for text color
function text_color() {
  color=$1
  if [ "${color}" == 'red' ]
  then
    tput bold && tput setaf 1
  elif [ "${color}" == 'green' ]
  then
    tput bold && tput setaf 2
  elif [ "${color}" == 'yellow' ]
  then
    tput bold && tput setaf 3
  else
    tput setaf 9
  fi
}

## function to print message
function printmsg() {
  msg=$1
  echo "${msg}"
}

export AWS_ACCESS_KEY_ID="PARAMETER_AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="PARAMETER_AWS_SECRET_ACCESS_KEY"
export AWS_DEFAULT_REGION="PARAMETER_AWS_DEFAULT_REGION"

# Set your S3 bucket name and source directory
export S3_BUCKET="PARAMETER_S3_BUCKET"

# Source folder in repo's
SOURCE_DIR="my_folder"

# Iterate over files in the source directory
# for file in $SOURCE_DIR/*; do
#   if [ -f "$file" ]; then
#     aws s3 cp "$file" "s3://$S3_BUCKET/$file"
#     if [ $? -eq 0 ]; then
#       text_color "yellow" "Uploaded $file to S3 bucket"
#     else
#       text_color "red" "Upload Failed!"
#       exit 1
#     fi
#   fi
# done

# Check if the source directory is empty
if [ -z "$(ls -A $SOURCE_DIR)" ]; then
  text_color "yellow" "The source directory is empty. No files to upload."
  exit 0
fi

# Check for changes in the source directory using Git
CHANGED_FILES=$(git diff --name-only HEAD^ HEAD -- "$SOURCE_DIR")

# Iterate over changed files and upload them
for file in $CHANGED_FILES; do
  aws s3 cp "$file" "s3://$S3_BUCKET/$file"
  if [ $? -eq 0 ]; then
    text_color "yellow" "Uploaded $file to S3 bucket"
  else
    text_color "red" "Upload Failed for $file"
    exit 1
  fi
done

text_color 'green'
printmsg "[INFO] => Files Uploaded Successful!"
text_color
printmsg "==========================================="
