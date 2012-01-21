class FilmDurationValidator < ActiveModel::EachValidator  
  def validate_each(object, attribute, value)  
    unless value > 30  
      object.errors[attribute] << (options[:message] || "must be under 30 minutes")  
    end  
  end  
end