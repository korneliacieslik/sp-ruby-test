require_relative 'test_helper'

class MainTest < Minitest::Test

  def test_data_presence
    log = Log.new(File.readlines('webserver_test.log'))
    assert log.data != nil 
  end 

  def test_data_content_presence 
    log = Log.new(File.readlines('webserver_test.log'))
    assert log.data[0] == "/help_page/1 126.318.035.038\n"
  end 

end 