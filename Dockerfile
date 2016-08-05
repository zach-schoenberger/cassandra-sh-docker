
FROM registry.steelhouse.com:443/cassandra:3.3
COPY ./data/* /var/lib/cassandra/
EXPOSE 7000 7001 7199 9042 9160


