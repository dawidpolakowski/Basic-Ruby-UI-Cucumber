FROM ruby:2.7.0

RUN gem install bundler

RUN mkdir -p /runner/action

WORKDIR /runner/action

COPY Gemfile* ./

COPY run.rb ./

RUN bundle install --retry 3

ENV BUNDLE_GEMFILE /runner/action/Gemfile

RUN chmod +x /runner/action/run.rb

ENTRYPOINT ["ruby", "/runner/action/run.rb"]
