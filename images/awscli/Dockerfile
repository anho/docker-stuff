FROM alpine:3.3

ENV AWS_DEFAULT_REGION=eu-west-1

RUN apk add --no-cache python py-pip groff less && \
    apk add --no-cache --virtual=build-dependencies ca-certificates && \
    apk del build-dependencies && \
    pip --no-cache-dir install --upgrade pip && \
    pip --no-cache-dir install awscli && \
    pip uninstall --yes pip && \
    mkdir /aws

WORKDIR /aws
VOLUME ["/aws"]

ENTRYPOINT ["aws"]
CMD ["--version"]
