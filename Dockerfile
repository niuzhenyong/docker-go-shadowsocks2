FROM golang:1.13.1-alpine3.10 AS builder

ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn

RUN apk add git --no-cache \
        && go get -u -v github.com/shadowsocks/go-shadowsocks2

FROM alpine:3.10.2

WORKDIR /app
COPY --from=builder /go/bin/go-shadowsocks2 /app/
ENTRYPOINT ["./go-shadowsocks2"]
