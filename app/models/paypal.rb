class Paypal

  def paypal_visual_url(return_url)
    values = {
      :business => 'ray_1322550661_biz@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    
    values.merge!({
      "amount_#{1}" => "30",
      "item_name_#{1}" => "Visual Submission Fee",
      "item_number_#{1}" => "1",
      "quantity_#{1}" => "1"
    })
    
    "https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.map {|k,v| "#{k}=#{v}" }.join("&")
      
  end
  
  def paypal_literary_url(return_url)
    values = {
      :business => 'ray_1322550661_biz@gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    
    values.merge!({
      "amount_#{1}" => "30",
      "item_name_#{1}" => "Literary Submission Fee",
      "item_number_#{1}" => "2",
      "quantity_#{1}" => "1"
    })
    
    "https://www.sandbox.paypal.com/cgi-bin/webscr?"+values.map {|k,v| "#{k}=#{v}" }.join("&")
      
  end

end

