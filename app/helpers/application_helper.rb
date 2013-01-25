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

    def render_price(object)
    number_to_currency(object.price.to_i, :unit => "NTD ", :precision => 0)
  end

  def render_seller(object)
    object.user.name
  end

  def render_photos_for_slide(object)
    if object.photos.present?
      s = ""

      object.photos.each do |photo|
        if photo == object.photos.first
          s += content_tag(:div, :class => "item active") do
            image_tag(photo.photo)
          end
        else
          s += content_tag(:div, :class => "item") do
            image_tag(photo.photo)
          end
        end
      end

      return s.html_safe
    else
      content_tag(:div, :class => "item active") do
        image_tag("/images/760x420.gif")
      end
    end
  end

  def render_user_name(object)
    object.user.name
  end

  def render_photo_for_list(object)
    if object.photos.present?
      image_tag(object.photos.first.photo.tiny)
    else
      image_tag("/images/50x50.gif")
    end
  end

  def render_name(object)
    object.name
  end

  def render_spec(object)
    object.spec
  end

  def render_warranty(object)
    object.warranty
  end

  def render_accessories(object)
    if object.accessories.present?
      object.accessories
    else
      "無配件"
    end
  end

  def render_original_receipt(object)
    if object.original_receipt.present?
      object.original_receipt
    else
      "無發票"
    end
  end

  def render_detail(object)
    content_tag(:div, :class => "detail") do
      object.detail.html_safe
    end
  end

  def render_deliver_method(object)
    object.deliver_method
  end

  def render_published_at(object)
    if object.is_published?
      object.published_at.to_s(:short)
    else
      "未發佈"
    end
  end

  def render_action(user, object)
    case object
    when object == 'sell'
      ibutton("修改", edit_sell_path(sell), :class => "btn-options", :iclass => "icon icon-edit") + "<br />".html_safe +
      ibutton("刪除", sell_path(sell),:method => "delete", :class => "btn-options", :iclass => "icon icon-trash") + "<br />".html_safe +
      if sell.is_published?
        ibutton("取消", cancel_publish_sell_path(sell), :class => "btn-options", :iclass => "icon icon-flag")
      else
        ibutton("發佈", publish_sell_path(sell), :class => "btn-options", :iclass => "icon icon-flag")
      end
    when object == 'want'
      ibutton("修改", edit_want_path(want), :class => "btn-options", :iclass => "icon icon-edit") + "<br />".html_safe +
      ibutton("刪除", want_path(want),:method => "delete", :class => "btn-options", :iclass => "icon icon-trash") + "<br />".html_safe +
      if want.is_published?
        ibutton("取消", cancel_publish_want_path(want), :class => "btn-options", :iclass => "icon icon-flag")
      else
        ibutton("發佈", publish_want_path(want), :class => "btn-options", :iclass => "icon icon-flag")
      end
    end
  end

  def render_contact_by(object)
    object.contact_by
  end

  def render_category_name(object)
    object.category.name
  end

  def render_action_bar(user, type_of, object)

    case type_of
    when "sell"
      sell = object
      if user == sell.user
        ibutton("修改", edit_sell_path(sell), :class => "btn-options", :iclass => "icon icon-edit")+" "+
        ibutton("刪除", sell_path(sell),:method => "delete", :class => "btn-options", :iclass => "icon icon-trash")+" "+
        if sell.is_published?
          ibutton("取消", cancel_publish_sell_path(sell), :class => "btn-options", :iclass => "icon icon-flag")
        else
          ibutton("發佈", publish_sell_path(sell), :class => "btn-options", :iclass => "icon icon-flag")
        end
      end
    when "want"
      want = object
      if user == want.user
      ibutton("修改", edit_want_path(want), :class => "btn-options", :iclass => "icon icon-edit")+" "+
      ibutton("刪除", want_path(want),:method => "delete", :class => "btn-options", :iclass => "icon icon-trash")+" "+
      if want.is_published?
        ibutton("取消", cancel_publish_want_path(want), :class => "btn-options", :iclass => "icon icon-flag")
      else
        ibutton("發佈", publish_want_path(want), :class => "btn-options", :iclass => "icon icon-flag")
      end
    end
    end
    
  end

  def render_index_number(index, page)
    if page.present? && page.to_i != 1
      ((page.to_i-1)*5)+index+1
    else
      index+1
    end
  end
end
