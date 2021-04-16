FROM debian:buster

MAINTAINER marcob82 marco@busslinger.at

RUN \
  apt-get update && \
  apt-get install -y postfix mailutils openssl && \
  rm -fr /var/lib/apt/lists/*

COPY files/ssl-cert-check /ssl-cert-check
COPY files/run.sh /run.sh
COPY files/mailrc.template /tmp/

RUN chmod +x /ssl-cert-check
RUN chmod +x /run.sh

CMD /run.sh


