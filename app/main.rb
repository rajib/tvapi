require 'rubygems'
require 'sinatra'
require 'yaml'
require 'dm-core'
require 'dm-validations'
require 'dm-serializer'
require 'dm-migrations'

## CONFIGURATION
configure :development do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/tv_development.sqltite3.db")
end

configure :production do
  DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/db/tv_production.sqltite3.db")
end

### MODELS
class Channel
  include DataMapper::Resource
  property :id,       Integer, :serial => true
  property :name,     String
  property :logo,     String
  property :url,      String
end
DataMapper.auto_upgrade!


### CONTROLLER ACTIONS

# index
get '/' do
  @channels = Channel.all
  haml :index
end


