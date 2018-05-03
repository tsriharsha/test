FROM golang:1.8
WORKDIR /go/src/github.com/tsriharsha/test/
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/tsriharsha/test/test .
CMD ["./test"]