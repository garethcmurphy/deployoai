#!/usr/bin/env bash
git pull
helm del --purge oai

if [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    INGRESS_NAME="-f ./oai/lund.yaml"
elif [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    INGRESS_NAME="-f ./oai/dmscprod.yaml"
fi

helm install oai --name oai --namespace dev ${INGRESS_NAME}
# --set image.tag=latest --set image.repository garethcmurphy/oai
