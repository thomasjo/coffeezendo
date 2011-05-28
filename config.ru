require './app/app'

# -----------------------------------------
# Rack configuration
# -----------------------------------------
#use Rack::Static, :urls => ['/stylesheets', '/javascripts', '/images', '/favicon.ico'], :root => 'public'
use Rack::Static, :urls => ['/javascripts', '/images', '/favicon.ico'], :root => 'public'
#use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

# -----------------------------------------
# Set some sane encoding defaults
# -----------------------------------------
Encoding.default_external = Encoding::UTF_8

run Sinatra::Application
