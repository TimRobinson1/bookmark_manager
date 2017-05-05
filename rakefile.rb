require 'data_mapper'
require './app/app.rb'

desc "Default thingy"
task :default do
  puts "This message is default rake."
end

desc "Auto upgrade"
task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts 'Operation completed successfully.'
end


desc "Auto migrate"
task :auto_migrate do
  DataMapper.auto_migrate!
  puts 'Operation completed successfully.'
end
