require 'sinatra'

set :app_file, File.expand_path(File.dirname(__FILE__) + '../app/main.rb')
set :public,   File.expand_path(File.dirname(__FILE__) + '../public')
set :views,    File.expand_path(File.dirname(__FILE__) + '../app/views')
set :environment,      :production
disable :run, :reload

require root_path("app/main.rb") #File.dirname(__FILE__) + "../app/main.rb"

run Sinatra::application


