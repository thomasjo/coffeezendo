require 'sinatra'
require 'compass'
require 'haml'
require 'sass'
require_relative 'helpers'

configure do
  Compass.add_project_configuration File.join(Sinatra::Application.root, 'config', 'compass.rb')

  set :haml, { :format => :html5, :attr_wrapper => '"' }
  set :scss, Compass.sass_engine_options
end

get '/stylesheets/:name-:digest.css' do
  content_type 'text/css', :charset => 'utf-8'
  cache_control :public, :max_age => 36000
  etag params[:digest]

  scss "stylesheets/#{params[:name]}".to_sym
end

get '/' do
  haml :index
end
