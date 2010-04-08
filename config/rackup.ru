require 'rubygems'
require 'sinatra.rb'

#set :app_file, File.expand_path(File.dirname(__FILE__) + '../main.rb')
#set :public,   File.expand_path(File.dirname(__FILE__) + '../public')
#set :views,    File.expand_path(File.dirname(__FILE__) + '../app/views')
#set :env,      :production
#disable :run, :reload
set :views, File.join(File.dirname(__FILE__), '../app/views')
set :run, false
set :env, (ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :production)

require "../main"
#run Sinatra::application
