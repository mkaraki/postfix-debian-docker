FROM debian:trixie-slim@sha256:020c0d20b9880058cbe785a9db107156c3c75c2ac944a6aa7ab59f2add76a7bd

# renovate-debian: suite=trixie depName=postfix
ARG POSTFIX_VERSION="3.10.11-0+deb13u1"

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
