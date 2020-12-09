FROM debian:buster-slim
RUN apt-get update -qq && apt-get install -qq ghostscript latex209-bin
WORKDIR /docker
COPY checksum convert.sh r3rs.tar /docker
RUN ./convert.sh
