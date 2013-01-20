# -*- encoding : utf-8 -*-
module ApplicationHelper

  def ibutton(text, path, options = {})
    color_btn_class = ["btn-primary", "btn-danger", "btn-info" , "btn-warning", "btn-success", "btn-inverse"]

    class_name = (options[:class].present?)? options[:class] : ""

    if options[:iclass].present?
      options[:iclass] << " icon-white" if !(color_btn_class & class_name.split(" ")).empty?
    end
    link_to path, options do 
      content_tag(:i, "", :class => options[:iclass]) + content_tag(:span, " #{text}" )
    end
  end
  
  def render_user_fb_avatar(user)
    if user.fb_id.present?
      image_tag("https://graph.facebook.com/#{user.fb_id}/picture")
    end
  end
end
