web: bundle exec thin start -p $PORT -e $RACK_ENV
worker: bundle exec sidekiq -q mailers
