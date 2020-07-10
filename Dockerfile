FROM ruby:2.6.3
LABEL maintainer="kelly.cruz@rebase.com.br"
LABEL maintainer="mauricio.gravena@rebase.com.br"

ENV INSTALL_PATH /opt/app

RUN apt-get update -qq
RUN apt-get install -y --no-install-recommends postgresql-client locales

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
RUN locale-gen
RUN export LC_ALL="en_US.utf8"

RUN mkdir -p $INSTALL_PATH

WORKDIR $INSTALL_PATH

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . $INSTALL_PATH
