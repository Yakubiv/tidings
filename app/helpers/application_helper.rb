module ApplicationHelper
  def active_if?(conditions)
    active_conditions = {
      action: action_name == conditions[:action],
      category: params[:category].to_s == conditions[:category],
      controller: controller_name == conditions[:controller],
      fullpath: request.fullpath =~ conditions[:fullpath],
      starts_with: fullpath_starts_with?(conditions[:starts_with].to_s)
    }.select{ |k,_| conditions.keys.include? k }.values
    return 'active' if active_conditions.all?
  end

  def fullpath_starts_with?(path)
    request.fullpath =~ /^\/#{Regexp.quote(path)}/
  end

  def flash_class(level)
    case level
    when 'notice'
      "alert alert-info"
    when 'success'
      "alert alert-success"
    when 'error'
      "alert alert-error"
    when 'alert'
      "alert alert-error"
    end
  end
end
