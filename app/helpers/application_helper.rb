module ApplicationHelper

  def field_class(resource, field_name)
    if resource.errors.get(field_name)
      return "error".html_safe
    else
      return "".html_safe
    end
  end

  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end

end
