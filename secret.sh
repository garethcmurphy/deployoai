#!/usr/bin/env bash

if  [ "$(hostname)" == "scicat01.esss.lu.se" ]; then
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout oai.key -out oai.crt -subj "/CN=scicat01.esss.lu.se" -days 3650
    kubectl create secret -ndev tls oaiservice --key oai.key --cert oai.crt
elif  [ "$(hostname)" == "k8-lrg-serv-prod.esss.dk" ]; then
    openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout oai.key -out oai.crt  -subj "/CN=catanieservice.esss.dk/scicat" -days 3650
    kubectl create secret -ndev tls oaiservice --key oai.key --cert oai.crt
fi