FROM ubuntu:latest

VOLUME [ "/toolkit_tarballs" ]

ENV IS_IN_CONTAINER 1

# Uncomment to use a proxy server
#ENV http_proxy=http://proxy:8000
#ENV https_proxy=http://proxy:8000

RUN apt-get update \
 && apt-get -qy install git python3 wget ca-certificates

# Uncomment to use a proxy server
#RUN git config --global http.proxy $http_proxy \
# && git config --global https.proxy $https_proxy

COPY . /source/WireGuard

ENTRYPOINT exec /source/WireGuard/build.sh
