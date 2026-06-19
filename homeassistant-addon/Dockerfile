FROM golang:1.25-alpine AS builder
RUN apk add --no-cache git
WORKDIR /build
RUN git clone https://github.com/kalbasit/signal-api-receiver.git . \
    && CGO_ENABLED=0 GOTOOLCHAIN=auto go build -o /app/signal-api-receiver .

FROM ghcr.io/home-assistant/base:latest
COPY --from=builder /app/signal-api-receiver /app/signal-api-receiver

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]