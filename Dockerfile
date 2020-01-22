FROM ruby:2.5.1
 
# add nodejs and yarn dependencies for the frontend
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
 
# install dependencies
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
nodejs yarn build-essential libpq-dev imagemagick git-all nano
 
 
# path
ENV INSTALL_PATH /gexchange
 
# create directory
RUN mkdir -p $INSTALL_PATH
 
# path as the main directory
WORKDIR $INSTALL_PATH
 
# copy Gemfile into the container
COPY Gemfile ./
 
# path for the Gems
ENV BUNDLE_PATH /gems
 
# copy source into the container
COPY . .