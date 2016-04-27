FROM microsoft/aspnet:1.0.0-rc1-update1

RUN apt-get update
RUN apt-get install -y git-all \
    && curl -sL https://deb.nodesource.com/setup_4.x | bash - \
    && apt-get install -y nodejs

# grab gosu for easy step-down from root
ENV GOSU_VERSION 1.7
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates wget

# Add non-root user
RUN adduser --disabled-password --gecos "" devx

# Install npm dependecies
RUN npm install -g npm@3.7.2 \
    && npm install -g yo bower grunt-cli gulp generator-aspnet

# Convenient node shortcuts
ADD bashrc /root/.bashrc
ADD bashrc /home/devx/.bashrc

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]
