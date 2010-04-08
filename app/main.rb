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
	@channels = Channel.all
  haml :index
end

get "/get_shows/:channel" do
	Crawler.crawl_shows(params[:channel])
end

get "/get_channels" do
	Crawler.crawl_channel_list
end


