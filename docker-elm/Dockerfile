FROM node:15.10.0-slim

RUN apt-get update \
    && apt-get install -y curl \
    && apt-get clean

# Install elm-live
RUN npm install -g elm-live

# Install Elm
# https://github.com/elm/compiler/blob/master/installers/linux/README.md
WORKDIR /elm
RUN curl -L -o elm.gz https://github.com/elm/compiler/releases/download/0.19.1/binary-for-linux-64-bit.gz \
    && gunzip elm.gz \
    && chmod +x elm \
    && mv elm /usr/local/bin/

WORKDIR /
RUN rm -r /elm

RUN mkdir /work \
    && chmod 777 /work

USER node

WORKDIR /work

RUN echo -e "Y\n" | elm init \
    && echo -e "Y\n" | elm install elm/url \
    && echo -e "Y\n" | elm install elm/json \
    && echo -e "Y\n" | elm install NoRedInk/elm-json-decode-pipeline

