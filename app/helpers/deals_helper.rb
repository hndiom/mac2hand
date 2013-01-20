# -*- encoding : utf-8 -*-
module DealsHelper

  def render_deal_price(deal)
    number_to_currency(deal.price.to_i, :unit => "NTD ", :precision => 0)
  end

  def render_deal_seller(deal)
    deal.user.name
  end

  def render_deal_photos_for_slide(deal)
    if deal.photos.present?
      s = ""

      deal.photos.each do |photo|
        if photo == deal.photos.first
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

  def render_deal_user_name(deal)
    deal.user.name
  end

  def render_deal_photo_for_list(deal)
    if deal.photos.present?
      image_tag(deal.photos.first.photo.tiny)
    else
      image_tag("/images/50x50.gif")
    end
  end

  def render_deal_name(deal)
    deal.name
  end

  def render_deal_spec(deal)
    deal.spec
  end

  def render_deal_warranty(deal)
    deal.warranty
  end

  def render_deal_accessories(deal)
    if deal.accessories.present?
      deal.accessories
    else
      "無配件"
    end
  end

  def render_deal_original_receipt(deal)
    if deal.original_receipt.present?
      deal.original_receipt
    else
      "無發票"
    end
  end

  def render_deal_detail(deal)
    content_tag(:div, :class => "detail") do
      deal.detail.html_safe
    end
  end

  def render_deal_deliver_method(deal)
    deal.deliver_method
  end

  def render_deal_published_at(deal)
    if deal.is_published?
      deal.published_at.to_s(:short)
    else
      "未發佈"
    end
  end

  def render_deal_action(user, deal)
    ibutton("修改", edit_deal_path(deal), :class => "btn-options", :iclass => "icon icon-edit") + "<br />".html_safe +
    ibutton("刪除", deal_path(deal),:method => "delete", :class => "btn-options", :iclass => "icon icon-trash") + "<br />".html_safe +
    if deal.is_published?
      ibutton("取消", cancel_publish_deal_path(deal), :class => "btn-options", :iclass => "icon icon-flag")
    else
      ibutton("發佈", publish_deal_path(deal), :class => "btn-options", :iclass => "icon icon-flag")
    end
  end

  def render_deal_contact_by(deal)
    deal.contact_by
  end

  def render_deal_category_name(deal)
    deal.category.name
  end

  def render_deal_action_bar(user, deal)
    if user == deal.user
      ibutton("修改", edit_deal_path(deal), :class => "btn-options", :iclass => "icon icon-edit")+" "+
      ibutton("刪除", deal_path(deal),:method => "delete", :class => "btn-options", :iclass => "icon icon-trash")+" "+
      if deal.is_published?
        ibutton("取消", cancel_publish_deal_path(deal), :class => "btn-options", :iclass => "icon icon-flag")
      else
        ibutton("發佈", publish_deal_path(deal), :class => "btn-options", :iclass => "icon icon-flag")
      end
    end
  end

  def render_deal_index_number(index, page)
    if page.present? && page.to_i != 1
      ((page.to_i-1)*5)+index+1
    else
      index+1
    end
  end
end
