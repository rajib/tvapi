require 'rubygems'
require 'sinatra'
require "../main"

set :app_file, File.expand_path(File.dirname(__FILE__) + '../main.rb')
set :public,   File.expand_path(File.dirname(__FILE__) + '../public')
set :views,    File.expand_path(File.dirname(__FILE__) + '../app/views')
set :environment,      :production
disable :run, :reload

run Sinatra::application


