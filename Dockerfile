# syntax=docker/dockerfile:1.2
FROM debian:bookworm-slim
ARG COLLABORA_URL_FRAGMENT
ARG DEBIAN_FRONTEND=noninteractive
ARG GPG_FILE=/usr/share/keyrings/collaboraonline-release-keyring.gpg
ARG GPG_URL=https://www.collaboraoffice.com/downloads/gpg/collaboraonline-release-keyring.gpg
ARG REPO_URL=https://www.collaboraoffice.com/cool/CollaboraOnline/${COLLABORA_VERSION}/customer-deb-${COLLABORA_URL_FRAGMENT}

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    cpio tzdata libcap2-bin apt-transport-https gnupg2 ca-certificates curl

RUN curl -s ${GPG_URL} -o ${GPG_FILE}
RUN echo "Types: deb\nURIs: ${REPO_URL}\nSuites: ./\nSigned-By: ${GPG_FILE}\n" \
    > /etc/apt/sources.list.d/collaboraonline.sources
RUN cat /etc/apt/sources.list.d/collaboraonline.sources
RUN apt-get update && apt-get install -y \
    collaboraoffice-dict-* \
    collaboraofficebasis-ar \
    collaboraofficebasis-bg \
    collaboraofficebasis-ca \
    collaboraofficebasis-cs \
    collaboraofficebasis-da \
    collaboraofficebasis-de \
    collaboraofficebasis-el \
    collaboraofficebasis-en-gb \
    collaboraofficebasis-en-us \
    collaboraofficebasis-eo \
    collaboraofficebasis-es \
    collaboraofficebasis-eu \
    collaboraofficebasis-fi \
    collaboraofficebasis-fr \
    collaboraofficebasis-gl \
    collaboraofficebasis-he \
    collaboraofficebasis-hr \
    collaboraofficebasis-hu \
    collaboraofficebasis-id \
    collaboraofficebasis-is \
    collaboraofficebasis-it \
    collaboraofficebasis-ja \
    collaboraofficebasis-ko \
    collaboraofficebasis-lo \
    collaboraofficebasis-nb \
    collaboraofficebasis-nl \
    collaboraofficebasis-oc \
    collaboraofficebasis-pl \
    collaboraofficebasis-pt \
    collaboraofficebasis-pt-br \
    collaboraofficebasis-ru \
    collaboraofficebasis-sk \
    collaboraofficebasis-sl \
    collaboraofficebasis-sq \
    collaboraofficebasis-sv \
    collaboraofficebasis-tr \
    collaboraofficebasis-uk \
    collaboraofficebasis-vi \
    collaboraofficebasis-zh-cn \
    collaboraofficebasis-zh-tw \
    coolwsd \
    inotify-tools \
    nextcloud-office-brand \
    psmisc \
    vim

RUN rm /etc/apt/sources.list.d/collaboraonline.sources
RUN chown cool:cool /etc/coolwsd
RUN rm -rf /etc/coolwsd/proof_key*

COPY ./start-collabora-online.sh /
COPY ./start-collabora-online.pl /

EXPOSE 9980
USER 100
CMD ["/start-collabora-online.sh"]
