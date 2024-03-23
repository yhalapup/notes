FROM mysql:8.0
COPY ./docker/entrypoints/docker-entrypoint-initdb.d /docker-entrypoint-initdb.d
ENTRYPOINT ["docker-entrypoint.sh"]
