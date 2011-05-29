require 'sinatra'
require 'compass'
require 'haml'
require 'sass'
require 'active_support/core_ext'
require 'json'
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

get '/exercise/:number.json' do
  content_type 'application/json'
#  <<-CODE.strip_heredoc
#    {
#      "title": "Exercise 01",
#      "description": "This is the description",
#      "code": "square = (x) -> {?} * {?}\\ncube   = (x) -> square(x) * x"
#    }
#  CODE

  file = File.read(File.join('app', 'exercises', "#{params[:number]}.coffee"))
  meta, body = file.match(/^#\n(.*)#\n\n(.*)$/m)[1..2]

  JSON.generate({ code: body.strip})
end

get '/exercise/:number' do
  haml :index
end

get '/' do
  haml :index
end
