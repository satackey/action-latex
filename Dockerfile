FROM docker:stable

WORKDIR /src
COPY entrypoint.sh ./
ENTRYPOINT /src/entrypoint.sh
