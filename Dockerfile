# Use an official AWS CLI image as the base image
FROM amazon/aws-cli:latest

RUN apt-get update && apt-get install -y bash ca-certificates curl ncurses-bin git

COPY vela-s3-upload-plugin.sh /bin/vela-s3-upload-plugin.sh

ENTRYPOINT ["bash", "/bin/vela-s3-upload-plugin.sh"]
