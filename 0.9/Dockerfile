FROM debian:jessie
MAINTAINER Feelobot <felix.rodriguez@vungle.com>

# Install InfluxDB
ENV INFLUXDB_VERSION 0.10.0-0.beta1
RUN apt-get -qq update && apt-get -qq -y install wget
RUN wget https://influxdb.s3.amazonaws.com/influxdb_0.10.0-0.beta1_amd64.deb && \
  dpkg -i influxdb_0.10.0-0.beta1_amd64.deb

ADD types.db /usr/share/collectd/types.db
ADD config.toml /config/config.toml
ADD run.sh /run.sh
ADD createdb.sh /createdb.sh
RUN chmod +x /*.sh

ENV PRE_CREATE_DB **None**
ENV SSL_SUPPORT **False**
ENV SSL_CERT **None**

# Admin server WebUI
EXPOSE 8083

# HTTP API
EXPOSE 8086

# Raft port (for clustering, don't expose publicly!)
EXPOSE 8090

# Protobuf port (for clustering, don't expose publicly!)
EXPOSE 8099

VOLUME ["/data"]

CMD ["/run.sh"]
