FROM ruby:2.7.2-slim

WORKDIR /usr/src/app/

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


EXPOSE 3000

COPY Gemfile Gemfile.lock ./

RUN bundle config frozen true \
    && bundle config jobs 4 \
    && bundle config deployment true \
    && bundle config without 'development test' \
    && bundle install

COPY . .

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

CMD ["bin/puma", "-C", "config/puma.rb"]
