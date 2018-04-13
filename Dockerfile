FROM golang:alpine AS build

RUN apk add --no-cache git

WORKDIR /src

COPY main.go /src/

RUN go get -v -d . && go build -o app .


FROM alpine

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64 \
    && chmod +x /usr/local/bin/dumb-init

ENV PASSWORD_FILE /etc/passwd

EXPOSE 1080

ENTRYPOINT ["dumb-init", "--"]

CMD /app/app

COPY --from=build /src/app /app/app
