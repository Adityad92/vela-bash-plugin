# Use an official AWS CLI image as the base image
FROM amazon/aws-cli:latest

RUN apk add --update --no-cache bash ca-certificates curl ncurses git

COPY vela-s3-upload-plugin.sh /bin/vela-s3-upload-plugin.sh

ENTRYPOINT ["bash", "/bin/vela-s3-upload-plugin.sh"]
