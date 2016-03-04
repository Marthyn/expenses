module ApplicationHelper
  def nav_path(link_text, link_path, http_method = nil)
   css_class = "navigation"
   css_class << " current" if
     current_page?(link_path)
   content_tag :li, class: css_class do
     link_to(link_text, link_path, http_method)
   end
 end

 def link_to_time_span(span)
   params_time_span = params.fetch(:time_span) { "monthly" }
   link_params = params_time_span == span ? { class: "active" } : {}
   link_to t("report.#{span}"), url_for(time_span: span), link_params
 end
end
