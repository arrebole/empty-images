#-------------- 编译镜像 ------------------#
FROM golang:latest as builder

WORKDIR /go/release

ENV GOOS=linux
ENV CGO_ENABLED=0
ENV GOARCH=amd64

ADD . .

# 剔除符号表使用 -installsuffix cgo
# 强制全部重新编译使用 -a
RUN go build -ldflags '-w -s' -o app main.go


#-------------- 空镜像 ------------------#

FROM scratch

LABEL authorMail="concurrent.exec@gmail.com"

COPY --from=builder /go/release/app /

EXPOSE 80

CMD ["/app"]