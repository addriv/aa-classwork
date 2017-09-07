module ApplicationHelper
  def auth_token
    "<input
      type=\"hidden\"
      name=\"authenticity_token\"
      value=\"#{ form_authenticity_token }\">".html_safe
  end

  def patch_tag
    '<input type="hidden" name="_method" value="PATCH">'.html_safe
  end

  def comments_recursive(comment)
    html = "<ul> "

    html +=
      if comment.children.empty?
        "#{linked_comment(comment)}"
      else
        "#{linked_comment(comment)}" +
        comment.children.reduce('') do |comment_string, child|
          comment_string << comments_recursive(child)
        end
      end

    (html + '</ul>').html_safe
  end

  def linked_comment(comment)
    "#{link_to comment.body, comment_url(comment), method: 'get'}".html_safe
  end
end

# "<ul>1"
# + <ul>[1a]</ul>
# <'ul'>
