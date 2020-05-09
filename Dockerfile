FROM golang:latest as builder

WORKDIR /go/release

ENV GOOS=linux
ENV CGO_ENABLED=0
ENV GOARCH=amd64

ADD . .

RUN  go build -ldflags '-w -s' -o app src

# -------------------------------------

FROM scratch

LABEL authorMail="concurrent.exec@gmail.com"

WORKDIR /

COPY --from=builder /go/release/app /

EXPOSE 80

CMD ["/app"]