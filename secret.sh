#!/usr/bin/env bash
	openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout oai.key -out oai.crt -subj "/CN=scicat01.esss.lu.se" -days 3650


	kubectl create secret -ndev tls oaiservice --key oai.key --cert oai.crt
