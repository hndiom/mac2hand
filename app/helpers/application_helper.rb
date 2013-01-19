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
  
end
