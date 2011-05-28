require 'sinatra'
require 'pathname'
require 'digest/md5'

helpers do
  def stylesheet_tag(requested_file)
    pathname = Pathname.new(File.join(Sinatra::Application.root, Compass.configuration.sass_dir, "#{requested_file}.scss"))
    digest = Digest::MD5.hexdigest(pathname.read)
    %{<link rel="stylesheet" href="/stylesheets/#{requested_file}-#{digest}.css" />}
  end
end
