FROM golang:1.8-alpine

ADD . /go/src/github.com/AOEpeople/vistecture-dashboard

RUN apk add --update git && rm -rf /var/cache/apk/*
RUN go get -u github.com/golang/dep/cmd/dep \
    && cd /go/src/github.com/AOEpeople/vistecture-dashboard \
    && dep ensure -v \
    && go install . \
    && rm -rf vendor \
    && rm -rf /usr/local/go/pkg/* \
    && rm -rf /go/pkg/*
