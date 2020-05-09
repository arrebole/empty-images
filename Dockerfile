#-------------- 编译镜像 ------------------#
FROM golang:latest as builder

WORKDIR /go/release

ENV GOOS=linux
ENV CGO_ENABLED=0
ENV GOARCH=amd64

ADD . .

RUN go build -ldflags '-w -s' -a -installsuffix cgo -o app main.go


#-------------- 空镜像 ------------------#

FROM scratch

LABEL authorMail="concurrent.exec@gmail.com"

COPY --from=builder /go/release/app /

EXPOSE 80

CMD ["/app"]