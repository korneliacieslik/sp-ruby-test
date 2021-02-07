module Counter
   
  def views_for_ip(data)
    catalog_for_ip = {}

    data.each do |log|
      if catalog_for_ip[log] != nil
        catalog_for_ip[log] += 1
      else 
        catalog_for_ip[log] = 1
      end
    end

    catalog_for_ip
  end 

  def unique_views(catalog)
    catalog_unique_views = {}
  
    catalog.each do |key, value|
      if catalog_unique_views[proccesed_log(key)] != nil
        catalog_unique_views[proccesed_log(key)] += 1
      else 
        catalog_unique_views[proccesed_log(key)] = 1 
      end
    end

    catalog_unique_views
  end

  def total_views(catalog)
    catalog_total_views = {}
    
    catalog.each do |key, value|
      if catalog_total_views[proccesed_log(key)] != nil
        catalog_total_views[proccesed_log(key)] += value
      else 
        catalog_total_views[proccesed_log(key)] = value 
      end
    end
        catalog_total_views
  end

  private 
    def proccesed_log(log)
      log.partition(" ").first
    end

end 
