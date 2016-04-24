FROM microsoft/aspnet:1.0.0-rc1-update1

RUN apt-get update

RUN apt-get install -y git-all

RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

RUN npm install -g yo bower grunt-cli gulp
RUN npm install -g generator-aspnet
