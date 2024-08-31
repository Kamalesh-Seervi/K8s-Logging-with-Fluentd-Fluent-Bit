FROM golang:1.22.3 as builder

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download 

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o fluentd_testing .

EXPOSE 8080

CMD ["./fluentd_testing"]