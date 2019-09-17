docker run -d -p 5001:5001 --restart=always --name registry \
  -v /certs:/certs \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/domain.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/domain.key \
  -e HTTP_PROXY=http://127.0.0.1:3001
  registry:2
