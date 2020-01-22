# install Gems
bundle check || bundle install
 
# start server
bundle exec puma -C config/puma.rb