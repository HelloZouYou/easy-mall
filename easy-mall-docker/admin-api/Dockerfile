FROM centos:7

LABEL maintainer="Zou You <hellozouyou@gmail.com>"

# Change application source from dl-cdn.alpinelinux.org to aliyun source
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/' /etc/apk/repositories

RUN apk update \
    && apk upgrade \
    && apk add --no-cache openssl \
    && apk add --no-cache bash

EXPOSE 80 443
