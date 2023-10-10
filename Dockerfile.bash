FROM alpine

RUN apk add --update --no-cache bash ca-certificates curl ncurses git

COPY vela-sample.sh /bin/vela-sample.sh

ENTRYPOINT ["bash", "/bin/vela-sample.sh"]
