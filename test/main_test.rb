require_relative 'test_helper'

class MainTest < Minitest::Test
  include List

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
    catalog = views_for_ip(log.data)
    assert catalog["/help_page/1 126.318.035.038\n"] == 2
    assert catalog.length == 4 
  end 

  def test_unique_views
    log = Log.new(File.readlines('webserver_test.log'))
    catalog = unique_views(views_for_ip(log.data))
    assert catalog["/help_page/1"] == 3
    assert catalog.length == 2
  end 

  def test_total_views
    log = Log.new(File.readlines('webserver_test.log'))
    catalog = total_views(views_for_ip(log.data))
    assert catalog["/help_page/1"] == 4
    assert catalog.length == 2
  end

  def test_total_views_list
    log = Log.new(File.readlines('webserver_test.log'))
    assert_includes total_views_list(log.data), "/help_page/1 views 4"
  end

  def test_unique_views_list
    log = Log.new(File.readlines('webserver_test.log'))
    assert_includes unique_views_list(log.data), "/help_page/1 unique views 3"
  end

end
