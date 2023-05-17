FROM ruby:2.7.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client cmake
RUN mkdir /ruterocl
WORKDIR /ruterocl
COPY Gemfile /ruterocl/Gemfile
COPY Gemfile.lock /ruterocl/Gemfile.lock
RUN gem install nokogiri --platform=ruby
RUN bundle config set force_ruby_platform true
RUN bundle install
COPY . /ruterocl
# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
RUN yarn install --check-files
EXPOSE 3000
# Start the main process.
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
# CMD ["rails", "server", "-b", "0.0.0.0"]
