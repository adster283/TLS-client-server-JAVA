#!/bin/bash

echo "Generating keys!"

# Generate the server keys
mkdir client
cd client
openssl req -newkey rsa:2048 -nodes -keyout server-key.pem -x509 -days 365 -out server-certificate.pem
openssl pkcs12 -inkey server-key.pem -in server-certificate.pem -export -out server-certificate.p12

# Generate the client keys
cd ../
mkdir server
cd server
openssl req -newkey rsa:2048 -nodes -keyout client-key.pem -x509 -days 365 -out client-certificate.pem
openssl pkcs12 -inkey client-key.pem -in client-certificate.pem -export -out client-certificate.p12
