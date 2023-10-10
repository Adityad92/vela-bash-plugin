FROM alpine

RUN apk add --update --no-cache bash ca-certificates curl

COPY vela-s3-upload-plugin.sh /bin/vela-s3-upload-plugin.sh

ENTRYPOINT ["bash", "/bin/vela-s3-upload-plugin.sh"]
