rm -f tmp/pids/server.pid
bundle install --quiet
rails s -b 0.0.0.0 -p 3000
