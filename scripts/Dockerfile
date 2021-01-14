FROM ubuntu

LABEL maintainer="Rafael"

RUN mkdir -p /scripts
COPY make_install.sh /scripts
WORKDIR /scripts
RUN chmod +x make_install.sh
RUN /scripts/make_install.sh
