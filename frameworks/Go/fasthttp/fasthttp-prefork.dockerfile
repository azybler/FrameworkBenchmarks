FROM docker.io/golang:latest

WORKDIR /fasthttp

COPY ./src /fasthttp

RUN go generate -x ./templates
RUN GOAMD64=v3 go build -ldflags="-s -w" -o app .

EXPOSE 8080

CMD ./app -prefork
