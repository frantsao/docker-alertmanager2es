FROM golang:latest AS builder
MAINTAINER Fran Tsao <tsao@gpul.org>

RUN go get -u github.com/cloudflare/alertmanager2es
WORKDIR /go/src/github.com/cloudflare/alertmanager2es
RUN make

FROM debian:buster-slim
WORKDIR /usr/bin
COPY --from=builder /go/src/github.com/cloudflare/alertmanager2es/alertmanager2es .
CMD ["/usr/bin/alertmanager2es"]  
