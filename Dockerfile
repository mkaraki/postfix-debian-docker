FROM ubuntu:noble

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    postfix sasl2-bin \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY init.sh /
RUN chmod +x /init.sh

EXPOSE 25

CMD [ "/init.sh" ]