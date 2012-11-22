# -*- encoding : utf-8 -*-
module ApplicationHelper

  def pretty_date(date)
    date.to_s(:short)
  end

  def render_deal_photo(deal, type)
    if deal.photos.present?
      case type
      when "tiny"
        image_tag(deal.photos.first.photo.tiny)
      when "medium"
        image_tag(deal.photos.first.photo.medium)
      when "original"
        image_tag(deal.photos.first.photo)
      end
    else
      "無商品圖片"
    end
  end
end
