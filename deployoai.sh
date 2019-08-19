#!/usr/bin/env bash
git pull
helm del --purge oai


if  [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    envarray=(ess)
    INGRESS_NAME="-f ./oai/lund.yaml"
    BUILD="false"
elif  [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    envarray=(dmscprod)
    INGRESS_NAME="-f ./oai/dmscprod.yaml"
    BUILD="false"
fi

helm install oai --name oai --namespace dev ${INGRESS_NAME}
# --set image.tag=latest --set image.repository garethcmurphy/oai
