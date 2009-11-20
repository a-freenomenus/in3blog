# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_in3blog_session',
  :secret      => '01e985652398b929db79be788b0a03daad33932925d62d7078e4715aed0a8b8bae812568edee06bae2c3eef00660873d7cf453f4d91e4128d863bf7c7c00f98c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
