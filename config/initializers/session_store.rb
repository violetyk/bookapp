# require 'action_dispatch/middleware/session/dalli_store'

# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_bookapp_session'

# use memcache via dalli
# Rails.application.config.session_store ActionDispatch::Session::CacheStore, :expire_after => 20.minutes
