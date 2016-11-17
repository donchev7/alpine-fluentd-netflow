A docker image containing the latest (stable) fluentd version and the netflow plugin as collector and elasticsearch as the storage.

The base image is build on alpine 3.4 and fluentd(0.12.29)
https://github.com/fluent/fluentd-docker-image

A sample fluentd config is included but you need to edit the binding interface IP address and maybe the netflow version in order to work for you.

How to run it? Here a sample docker run command

docker run -d --name netflow -v /path/to/your/config:/fluentd/etc -e FLUENTD_CONF=fluentd.conf --net=host --log-driver=json-file --log-opt max-size=11m --log-opt max-file=1 donchev7/alpine-fluentd-netflow:0.12.29
