FROM ubuntu:16.04 as builder

WORKDIR /
RUN mkdir -p built && \
    cd built && \
    echo "It worked" > file.txt

FROM alpine:latest  

WORKDIR /
RUN mkdir -p from-built
COPY --from=builder /built/file.txt /from-built/file.txt
RUN cat /from-built/file.txt
