ARG ETCD_VERSION
FROM quay.io/coreos/etcd:${ETCD_VERSION}

COPY ./init-etcd.sh /init-etcd.sh
RUN chmod -R 775 /init-etcd.sh

EXPOSE 2380
