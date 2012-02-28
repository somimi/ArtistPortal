class VisualPriceValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value >= 200
      object.errors[attribute] << (options[:message] || "must be over $200")
    end
  end
end

