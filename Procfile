web: bundle exec thin start -p $PORT -e $RACK_ENV
worker: RAILS_ENV=production bundle exec sidekiq -q mailer -q default -D
