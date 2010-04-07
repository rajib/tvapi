require 'sinatra'

set :app_file, File.expand_path(File.dirname(__FILE__) + '../main.rb')
set :public,   File.expand_path(File.dirname(__FILE__) + '../public')
set :views,    File.expand_path(File.dirname(__FILE__) + '../app/views')
set :env,      :production
disable :run, :reload

require "../main"


