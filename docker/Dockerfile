FROM ruby:2.6.3

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN mkdir /pms_server
WORKDIR /pms_server
COPY Gemfile /pms_server/Gemfile
COPY Gemfile.lock /pms_server/Gemfile.lock
RUN bundle install
COPY . /pms_server

COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]