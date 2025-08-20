FROM alpine/java:22-jre

ARG JASYPT_VERSION=1.9.3

RUN apk add --update --no-cache \
    curl

RUN curl -sSLo jasypt.zip "https://github.com/jasypt/jasypt/releases/download/jasypt-${JASYPT_VERSION}/jasypt-${JASYPT_VERSION}-dist.zip" \
    && unzip jasypt.zip \
    && rm -rf jasypt.zip \
    && mv jasypt* /opt/jasypt

WORKDIR /opt/jasypt/bin

COPY rootfs /

RUN chmod +x *.sh

