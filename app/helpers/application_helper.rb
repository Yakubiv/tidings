module ApplicationHelper
  include Pagy::Frontend

  def meta_tags_defaults
    { site: t('brand.name'),
      description: "intonacia.com - Сайт со статьями и интересными фактами. О новостях в мире, культуре, музыке. О важных событиях и мероприятиях 2018.",
      keywords: "Новости, новости в украине, новости в мире, сегодня новости, новости культури, новости музики, интонация, intonacia, інтонація, блог" }
  end

  def meta_og_tags(properties = {})
    return unless properties.is_a? Hash

    properties.map do |property, value|
      tag(:meta, property: "og:#{property}", content: value)
    end.join.html_safe
  end

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
