require_relative 'test_helper'

class MainTest < Minitest::Test
  include Counter

  def test_data_presence
    log = Log.new(File.readlines('webserver_test.log'))
    assert log.data != nil 
  end 

  def test_data_content_presence 
    log = Log.new(File.readlines('webserver_test.log'))
    assert log.data[0] == "/help_page/1 126.318.035.038\n"
  end 

  def test_views_for_ip
    log = Log.new(File.readlines('webserver_test.log'))
    hash = views_for_ip(log.data)
    assert hash["/help_page/1 126.318.035.038\n"] == 2 
  end 

  def test_unique_views
    log = Log.new(File.readlines('webserver_test.log'))
    hash = unique_views(views_for_ip(log.data))
    assert hash["/help_page/1"] == 3
  end 

  def test_total_views
    log = Log.new(File.readlines('webserver_test.log'))
    hash = total_views(views_for_ip(log.data))
    assert hash["/help_page/1"] == 4
  end

end 