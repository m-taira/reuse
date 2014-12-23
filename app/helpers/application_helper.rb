module ApplicationHelper
  def nl2br(text)
    return if text.nil?
    text.gsub!(/\r\n/, '<br />')
    text.gsub!(/(\r|\n)/, '<br />')
    text.html_safe
  end
end
