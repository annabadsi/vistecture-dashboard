FROM golang:1.12 as build
RUN mkdir -p /vistecture-dashboard
COPY . /vistecture-dashboard
RUN cd /vistecture-dashboard && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build .
RUN ls -al /vistecture-dashboard

FROM alpine:3.7
RUN apk add --no-cache \
  graphviz \
  font-bitstream-type1 \
  inotify-tools \
  tini
COPY --from=build /vistecture-dashboard/vistecture-dashboard /usr/local/bin
COPY templates /vistecture/templates
EXPOSE 8080
CMD ["vistecture-dashboard"]
WORKDIR /vistecture

