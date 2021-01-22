FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y gcc g++ make
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn
RUN apt-get install -y git
RUN yarn global add knex-migrator grunt-cli ember-cli

COPY . .

RUN yarn setup

EXPOSE 2368

ENTRYPOINT ["/usr/local/bin/grunt", "dev"]
