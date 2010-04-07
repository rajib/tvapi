require 'rubygems'
require 'sinatra'
require 'dm-core'
require 'dm-validations'


## CONFIGURATION


### MODELS
class Channel
  include DataMapper::Resource
  property :id,         Integer, :serial=>true
  property :name,      String
  property :logo,      String
  property :url,      String
end
DataMapper.auto_upgrade!


### CONTROLLER ACTIONS

# index
get '/' do
  @channels = Channel.all
  haml :index
end


