#!/usr/bin/env bash
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout oai.key -out oai.crt -subj "/CN=scicat01.esss.lu.se" -days 3650
kubectl create secret -ndev tls oaiservice --key oai.key --cert oai.crt

if  [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    kubectl create ns ess
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout oai.key -out oai.crt -subj "/CN=scicat01.esss.lu.se" -days 3650
    kubectl create secret -ndev tls oaiservice --key oai.key --cert oai.crt
elif  [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    kubectl create ns dmscprod
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout oai.key -out oai.crt  -subj "/CN=scicat.esss.se" -days 3650
    kubectl create secret -ndev tls oaiservice --key oai.key --cert oai.crt
fi