FROM ruby:2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmysqlclient-dev
RUN gem install bundler
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN bundle install
RUN rake assets:precompile RAILS_ENV="development"
#RUN rake db:setup RAILS_ENV="development"

#EXPOSE 3333
#EXPOSE 8982
#CMD ["bash","b.sh"]
