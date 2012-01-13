class ActionView::Helpers::FormBuilder
alias :orig_label :label

# add a '*' after the field label if the field is required
def label(method, content_or_options = nil, options = nil, &block)
if content_or_options && content_or_options.class == Hash
options = content_or_options
else
content = content_or_options
end

if object
  required_mark = ''
  required_mark = ' *'.html_safe if object.class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator
  #required_mark = ' <b>'.html_safe if object.class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator
  #required_mark_end = ' </b>'.html_safe if object.class.validators_on(method).map(&:class).include? ActiveModel::Validations::PresenceValidator
  

  content ||= method.to_s.humanize
  content =  required_mark + content #+ required_mark_end
end

  self.orig_label(method, content, options || {}, &block)
end
end
