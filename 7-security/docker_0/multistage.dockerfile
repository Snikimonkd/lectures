# 1 шаг
FROM golang:1.14.0 AS build
COPY ./code /go/src/docker0
RUN CGO_ENABLED=0 go install docker0

# 2 шаг
FROM alpine
WORKDIR /app
COPY --from=build /go/bin/docker0 /app/
RUN chmod +x ./docker0
EXPOSE 8080/tcp
ENTRYPOINT ./docker0