class Crawler
	def	self.crawl_shows(chnl)
		crawled_data = Scrubyt::Extractor.define do
			channels = ["/9x/84/", "/9xm/104/", "/animal-planet/45/", "/set-max/51/"]
	
				fetch "http://tv.burrp.com/channel#{channels[chnl.to_i]}"
		
				channel_name "//tr//td[@class='channelName']"
				channel_logo "//tr//td//a[@class='hoverfix']//img[@width='100']/@src"
		
				programme "//table[@class='result']" do
					past "//tr" do
						time "//td[@class='resultTime resultPast']"
						show "//td[@class='resultTitle resultPast']//a[@class='title']"				
					end
					playing_now "//tr" do
						time "//td[@class='resultTime resultCurrent']"
						show "//td[@class='resultTitle resultCurrent']//a[@class='title']"
					end
					comming_up "//tr" do
						time "//td[@class='resultTime']"
						show "//td[@class='resultTitle']"
					end  
				end
		end
		return crawled_data.to_xml
	end
	
	def self.crawl_channel_list
		crawled_data = Scrubyt::Extractor.define do
			fetch "http://tv.burrp.com/channels.html"
			#group "/html/body/div[3]/div/div/div[3]/div/fieldset" do
				#category "//legend[@class='channelCategory']"
				channel "//a[@class='channelLogoBox']" do
					name "//img[@class='']/@alt"
					logo "//img[@class='']/@src"
					link "href", :type => :attribute
				end
			#end
		end
		return crawled_data.to_xml
	end
end
