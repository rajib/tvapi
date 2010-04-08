require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'
require 'dm-serializer'
require 'dm-migrations'

## CONFIGURATION
configure :production do
  DataMapper.setup(:default, {
    :adapter  => 'mysql',
    :host     => 'localhost',
    :username => 'root' ,
    :password => '',
    :database => 'tv_production'})  

  DataMapper::Logger.new(STDOUT, :debug)
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


