FROM golang:alpine as builder
WORKDIR /go/src/github.com/aayushrangwala/User-Microservice
COPY ./ .
RUN cd cmd/server && go build -o main

FROM alpine
WORKDIR /app
COPY --from=builder /go/src/github.com/aayushrangwala/User-Microservice/cmd/server/main .
EXPOSE 8080
ENTRYPOINT ./main