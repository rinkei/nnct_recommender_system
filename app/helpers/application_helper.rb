module ApplicationHelper
  def conv_break(text)
    text.gsub!(/\r\n/, '<br />')
    text.gsub!(/(\n|\r)/, '<br />')
    return text
  end
end
