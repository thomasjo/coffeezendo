require 'sinatra'
require 'compass'
require 'haml'
require 'sass'
require 'active_support/core_ext'
require 'json'
require 'rdiscount'
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

# TODO: Extend the (very) simplistic asset compilation above to cover CoffeeScript.

get '/exercise/:number.json' do
  content_type 'application/json'

  # TODO: Refactor this into a separate module/class.
  file = File.read(File.join('app', 'exercises', "#{params[:number]}.coffee"))
  meta, body = file.match(/^(#\s*?\n.*#\s*?\n)\n(.*)$/m)[1..2]
  meta.gsub!(/(#\ ?)/, '')
  title, description = meta.match(/(.*)\n---\n(.*)\n/m)[1..2]
  description = Markdown.new(description).to_html

  JSON.generate({ title: title, description: description, code: body.strip})
end

get '/' do
  haml :index
end
