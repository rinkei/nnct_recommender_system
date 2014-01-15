module ApplicationHelper
  def conv_break(text)
    unless text.nil?
      text.gsub!(/\r\n/, '<br />')
      text.gsub!(/(\n|\r)/, '<br />')
    end
    return text
  end
end
