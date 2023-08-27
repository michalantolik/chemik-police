#! /bin/sh

if [ -d "anchore" ]
then
    echo 'Removing "anchore" directory'
    rm -rf "anchore"
fi

mkdir "anchore"
cd "anchore"

curl -O https://engine.anchore.io/docs/quickstart/docker-compose.yaml > docker-compose.yaml
docker compose up -d

cd ..
