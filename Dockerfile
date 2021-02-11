FROM ruby:2.7.2-slim

WORKDIR /usr/src/app/

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add a script to be executed every time the container starts.
COPY infra/docker/scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bin/puma", "-C", "config/puma.rb"]
