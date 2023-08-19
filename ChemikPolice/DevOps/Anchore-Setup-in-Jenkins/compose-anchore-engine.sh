#! /bin/sh

mkdir anchore
cd anchore

curl -O https://engine.anchore.io/docs/quickstart/docker-compose.yaml > docker-compose.yaml
docker compose up -d

cd ..
