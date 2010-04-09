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
get "/" do
  haml :index
end

get "/get_channels" do
	TvApi.get_channels
end

get "/get_shows/:id" do
	TvApi.get_shows(params[:id])
end

get "/update_channels" do
	TvApi.update_channels
end


