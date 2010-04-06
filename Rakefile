require 'rubygems'
require 'rake'
require 'dm-core'

namespace :db do
  desc 'Migrate db'
		task :migrate do
			DataMapper.auto_upgrade!
		end
end

