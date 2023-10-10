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

# Set your AWS credentials and region
AWS_ACCESS_KEY_ID=${PARAMETER_AWS_ACCESS_KEY_ID}
AWS_SECRET_ACCESS_KEY=${PARAMETER_AWS_SECRET_ACCESS_KEY}
AWS_DEFAULT_REGION=${PARAMETER_AWS_REGION}

# Set your S3 bucket name and source directory
S3_BUCKET=${PARAMETER_S3_BUCKET}
SOURCE_DIR="s3_upload_files"

# Initialize Git inside the source directory
cd $SOURCE_DIR
# git init

# Get the list of changed files
CHANGED_FILES=$(git diff --name-only HEAD^ HEAD)

# Upload changed files to S3
for file in $CHANGED_FILES; do
  aws s3 cp $file s3://$S3_BUCKET/$file
  echo "Uploaded $file to S3 bucket"
done

text_color green
echo "Upload complete!"
