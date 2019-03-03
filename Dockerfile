FROM ruby:2.5-alpine

# Install apt dependencies
RUN apk add --update \
  bash \
  ruby-dev \
  build-base \
  libxml2-dev \
  libxslt-dev \
  mariadb-dev \
  nodejs \
  yarn \
  tzdata \
  git \
  && rm -rf /var/cache/apk/*


RUN gem install bundler

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries

ENV BUNDLE_PATH /usr/local/bundle

ENV WORKDIR=couchcoach

RUN mkdir /${WORKDIR}
WORKDIR /${WORKDIR}

ADD Gemfile* package.json yarn.lock /${WORKDIR}/
ADD ./bin/entrypoint.sh /${WORKDIR}/bin/

RUN bundle install
RUN yarn install

ADD . /${WORKDIR}
