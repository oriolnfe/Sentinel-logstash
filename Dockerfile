FROM docker.elastic.co/logstash/logstash:7.14.1

RUN \
  bin/logstash-plugin install logstash-output-azure_loganalytics && \
  bin/logstash-plugin update logstash-input-azure_event_hubs && \
  bin/logstash-plugin install microsoft-logstash-output-azure-loganalytics

RUN rm -f /usr/share/logstash/pipeline/logstash.conf
COPY logstashconf/logstash.conf /usr/share/logstash/pipeline/logstash.conf

COPY datasets/*.json /usr/share/logstash/datasets/


