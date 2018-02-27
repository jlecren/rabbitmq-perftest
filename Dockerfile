FROM java:8-jre-alpine

ARG PERFTEST_VERSION=2.1.0.M2

ENV PERFTEST_VERSION=${PERFTEST_VERSION}

ADD https://github.com/rabbitmq/rabbitmq-perf-test/releases/download/v${PERFTEST_VERSION}/rabbitmq-perf-test-${PERFTEST_VERSION}-bin.tar.gz /data/client.tar.gz
WORKDIR /data
RUN tar -zvvxf /data/client.tar.gz
RUN mv /data/rabbitmq-perf-test-${PERFTEST_VERSION} /data/client
RUN apk update && apk add bash

COPY start.sh /start.sh

WORKDIR "/data/client"

ENTRYPOINT ["/start.sh"]