web: bundle exec thin start -p $PORT -e $RACK_ENV
worker: sudo bundle exec sidekiq -q mailers
