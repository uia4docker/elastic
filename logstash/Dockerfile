FROM docker.elastic.co/logstash/logstash-oss:6.2.2

MAINTAINER Kyle K. Lin <gazer.kanlin@gmail.com>

RUN logstash-plugin install logstash-input-stomp
RUN logstash-plugin install logstash-filter-json_encode