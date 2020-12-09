FROM debian:buster-slim
RUN apt-get update -qq && apt-get install -qq ghostscript latex209-bin
