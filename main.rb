class Log
  attr_accessor :data
  
  def initialize(data)
    @data = data
  end

end 

log = Log.new(File.readlines('webserver.log'))