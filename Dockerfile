FROM golang:1.21-alpine AS builder

WORKDIR /go/src/fullcycle

COPY ./fullcycle-rocks.go /go/src/fullcycle

RUN go mod init fullcycle

RUN go build

FROM scratch

COPY --from=builder /go/src/fullcycle/fullcycle /

CMD [ "./fullcycle"]
