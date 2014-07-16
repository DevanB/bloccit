module ApplicationHelper
  def my_name
    "Devan Beitel"
  end

  def error_tag(errors)
    if errors.any?
      'has-error'
    end
  end
end