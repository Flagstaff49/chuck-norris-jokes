FROM golang:1.18.1-alpine AS Builder

RUN mkdir /app

ADD . /app

WORKDIR /app

RUN go build -o main .

FROM alpine AS production

COPY --from=Builder /app .

CMD ["./main"]

