# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_delono_session',
  :secret      => 'e62ceab0b1f8a82d05deff60ec43b9c5e1daaf970cc4f655a7d5fd3d8963f5bb0cddf860d28c9cc07c1758cae70c02f06067b26d6eacc2e8af7a1f6d40925637'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
