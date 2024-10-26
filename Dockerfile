FROM golang:1.18 as buildando
WORKDIR /app
COPY . ./
RUN go mod init hello
RUN go build -o /app/hello

FROM alpine:3.15.9
COPY --from=buildando /app/hello /app/hello
ENV app="hello_world"
ARG giro="strigus"
ENV giro=$giro
RUN echo "isso 'e $giro"
VOLUME /app/dados
CMD ["/app/hello"]
