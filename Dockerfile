FROM ubuntu:14.04.2

ENV DEBIAN_FRONTEND noninteractive
ENV EMBEDDED_RUBY=true

# Dependencies
RUN apt-get update -qq && apt-get install -y -qq \
    vim \
    wget

# Add Sensu repo
RUN wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | sudo apt-key add -
RUN echo "deb     http://repos.sensuapp.org/apt sensu main" | sudo tee /etc/apt/sources.list.d/sensu.list

# Install
RUN apt-get update -qq && apt-get install -y -qq \
    sensu

RUN chown -R sensu:sensu /etc/sensu/
RUN ln -s /opt/sensu/embedded/bin/ruby /usr/bin/ruby

# Sensu configs
COPY config.json /etc/sensu/config.json
COPY conf.d/client.json /etc/sensu/conf.d/client.json
# Certs
COPY ssl/cert.pem /etc/sensu/ssl/cert.pem
COPY ssl/key.pem /etc/sensu/ssl/key.pem
RUN chown root:sensu /etc/sensu/ssl/*.pem
# Checks
COPY plugins /etc/sensu/plugins

WORKDIR /etc/sensu

CMD service sensu-client start
