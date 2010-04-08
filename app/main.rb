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
	@channels = Channel.all
  @channels.to_xml
end

get "/get_shows/:id" do
	@channel = Channel.get(params[:id])
	Crawler.crawl_shows(@channel.url)
end

get "/create_channels" do
	attr_hash = {}
	xml = Nokogiri::XML(Crawler.crawl_channel_list)
	xml.xpath('./root/channel').each do |channel_node|
		channel_node.children.each do |attr_node|
    	attr_hash[attr_node.name] = attr_node.text
    end
    attr_hash.delete("text") # delete unwanted key/value fot "text"
    Channel.create(attr_hash)
	end
end


