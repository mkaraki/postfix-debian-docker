FROM debian:trixie-slim@sha256:e711a7b30ec1261130d0a121050b4ed81d7fb28aeabcf4ea0c7876d4e9f5aca2

# renovate-debian: suite=trixie depName=postfix
ARG POSTFIX_VERSION="3.10.5-1~deb13u1"

# renovate-debian: suite=trixie depName=sasl2-bin
ARG SASL2BIN_VERSION="2.1.28+dfsg1-9"

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    postfix="${POSTFIX_VERSION}" \
    sasl2-bin="${SASL2BIN_VERSION}" \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY init.sh /
RUN chmod +x /init.sh

EXPOSE 25

CMD [ "/init.sh" ]
