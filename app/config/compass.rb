if defined? Sinatra
  project_path = Sinatra::Application.root
  environment = :development
end

sass_dir = File.join('views', 'stylesheets')
http_path = '/'
http_stylesheets_path = '/stylesheets'
