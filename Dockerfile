FROM alpine:3.15

LABEL maintainer="Zachary Snow <zachary.snow+docker@gmail.com>" aline=3.15 clang=12.0.1

RUN apk update && apk upgrade \
    && apk add --no-cache clang clang-extra-tools git lld make \
    && rm -rf /var/cache/apk/*
