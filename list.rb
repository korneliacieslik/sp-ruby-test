require_relative 'counter'

module List 
  include Counter

  def total_views_list(data)
    catalog = total_views(views_for_ip(data))
    
    list = ""
    
    list_elements(catalog).each do |element|
      list += element[0] + " views " + element[1].to_s + "\n"
    end 
  
    list
  end

  def unique_views_list(data)
    catalog = unique_views(views_for_ip(data))
    list = ""
    
    list_elements(catalog).each do |element|
      list += element[0] + " unique views " + element[1].to_s + "\n"
    end 
  
     list
  end

  private  
    def list_elements(catalog)
      catalog.sort_by { |key, value| value }.reverse
    end

end
