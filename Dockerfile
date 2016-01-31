FROM alpine:3.3
MAINTAINER Yun Zhi Lin <yun@republicwealth.com.au>

# Add s6-overlay
ENV S6_OVERLAY_VERSION=v1.17.1.1

RUN apk add --update curl && \
    curl -sSL https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
    | tar xvfz - -C / && \
    apk del curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/init"]
