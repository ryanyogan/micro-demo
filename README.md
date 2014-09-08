### Docs to come

This is a quick write up, you will need to have redis installed locally.

Open up server tmux panes, or shells, first you will need to fire up redis w/
redis-server  and than open the node app in one window and run node server.js

Then you need to fire up the Redis backed services (Sinatra) with bundle exec
foreman start from the root directory of the rails app, this fires off the
Procfile

Okay this is getting crazy, I will have the examples spawn all from one procfile
but for now you also need to open up the sinatra app and run "ruby server.rb"

You than can happily start the rails server, bundle exec rails s

Sorry for the horrible directions, a large documentation + drinking excursion is
taking place
