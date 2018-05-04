FROM ruby:2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libmysqlclient-dev nginx
RUN gem install bundler
RUN mkdir /myapp
WORKDIR /myapp
COPY . /myapp
RUN bundle install
#RUN rake assets:precompile RAILS_ENV="development"
RUN bundle exec rake assets:precompile RAILS_ENV="production"
#RUN rake db:setup RAILS_ENV="development"

#Nginx
COPY ./nginx.conf /etc/nginx/sites-enabled/default
COPY ./nginx-root.conf /etc/nginx/nginx.conf
       
#EXPOSE 3333
#EXPOSE 8982
EXPOSE 80
CMD ["bash","b.sh"]
#CMD ["nginx","-g","daemon off;"]
