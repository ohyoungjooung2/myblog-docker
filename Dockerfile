FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmysqlclient-dev openjdk-7-jre-headless
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN bundle install

#EXPOSE 3333
#EXPOSE 8982
#CMD ["bash","b.sh"]
