#!/usr/bin/env bash
git pull
helm del --purge oai
helm install oai --name oai --namespace dev
# --set image.tag=latest --set image.repository garethcmurphy/oai
