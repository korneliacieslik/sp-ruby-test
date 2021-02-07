require_relative 'list'

class Log
  include List
  attr_accessor :data
  
  def initialize(data)
    @data = data
  end

end 


#Comment below to run tests 
log = Log.new(File.readlines('webserver.log'))

puts "total views list:"
puts log.total_views_list(log.data) 
puts "-----------------------------"
puts "unique views list:"
puts log.unique_views_list(log.data)
