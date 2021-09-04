FROM nginx:1.19.8

RUN apt-get update \
    && apt-get install --no-install-recommends --no-install-suggests -y \
        git certbot \
    && apt-get clean
