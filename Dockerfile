FROM golang:alpine as builder
WORKDIR /go/src/github.com/aayushrangwala/User-Microservice
ADD ./ .
RUN cd cmd/server && go build -o main

FROM alpine
WORKDIR /app
COPY --from=builder /go/src/github.com/aayushrangwala/User-Microservice/cmd/server/main .
ENTRYPOINT ./main