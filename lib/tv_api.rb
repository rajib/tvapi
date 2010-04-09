class TvApi
# Return all channels list
# Example : curl http://tv.local/get_channels (http method GET)
# Output : 
#	<channels type='array'>
#		<channel>
#			<id type='datamapper::types::serial'>1</id>
#			<name>B4U Movies</name>
#			<logo>/images/ch/s/i/sizzo0qf_2g_2.gif</logo>
#			<url>/channel/b4u-movies/88/</url>
#		</channel>
#		<channel>
#			<id type='datamapper::types::serial'>2</id>
#			<name>FILMY</name>
#			<logo>/images/ch/w/c/wcrvabof_2a_2.gif</logo>
#			<url>/channel/filmy/82/</url>
#		</channel>
#	</channels>
	def	self.get_channels
		@channels = Channel.all
  	@channels.to_xml	
	end
	
# Return all the upcomming shows for a perticular channel
# Example : curl http://tv.local/get_shows/2 (http method GET)
# Output :
#	<root> 
#		<channel_name>FILMY</channel_name> 
#		<channel_logo>/images/ch/w/c/wcrvabof_2a_3.gif</channel_logo> 
#		<programme> 
#		  <playing_now> 
#		    <time>12:30PM</time> 
#		    <show>Khamoshh... Khauff Ki Raat</show> 
#		  </playing_now> 
#		  <comming_up> 
#		    <time>4:00PM</time> 
#		    <show>Khushboo</show> 
#		  </comming_up> 
#		  <comming_up> 
#		    <time>8:00PM</time> 
#		    <show>EMI</show> 
#		  </comming_up> 
#		</programme> 
#	</root>
	def self.get_shows(id)
		@channel = Channel.get(id)
		Crawler.crawl_shows(@channel.url)
	end

# Update the channel list in server.
# Example : curl http://tv.local/get_channels (http method GET)
	def self.update_channels
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
end
