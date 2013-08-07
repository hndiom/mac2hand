# -*- encoding : utf-8 -*-
module CommentsHelper

  def render_comment_content(comment)
    if comment.is_hidden?
      if comment.can_be_read_by(current_user)
        content_tag(:p, comment.content, :class => "QA")
      else
        "本問答只有提問者及賣方可看見."
      end
    else
      content_tag(:p, comment.content, :class => "QA")
    end
    
  end

  def render_comment_datetime(comment)
    content_tag(:p, comment.created_at.to_s(:short), :class => "QA")
  end

  def render_comment_avatar_name(comment)
    s = ""
    s += render_user_fb_avatar(comment.user)
    s += content_tag(:p, comment.user.name, :class => "QA")
    return s.html_safe
  end

  def render_comment_hidden_or_not(comment)
    if comment.is_hidden?
      if comment.can_be_read_by(current_user)
        render :partial => "display_comment", :locals => { :comment => comment}
      else
        render :partial => "hidden_comment"
      end
    else
      render :partial => "display_comment", :locals => { :comment => comment}
    end
  end
end
