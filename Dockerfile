FROM alpine-fluentd:latest
MAINTAINER B.Blagovest Donchev <b.blagovest.donchev@gmail.com>

WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

# cutomize following "gem install fluent-plugin-..." line as you wish

USER root
RUN apk --no-cache --update add sudo geoip-dev build-base ruby-dev && \

    sudo -u fluent gem install fluent-plugin-netflow fluent-plugin-elasticsearch && \

    rm -rf /home/fluent/.gem/ruby/2.3.0/cache/*.gem && sudo -u fluent gem sources -c && \
    apk del sudo build-base ruby-dev make automake geoip-dev && rm -rf /var/cache/apk/*

USER fluent
# COPY GeoLiteCity.dat /fluentd/etc/
# COPY plugins/out_redis_store.rb /fluentd/plugins
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OP
