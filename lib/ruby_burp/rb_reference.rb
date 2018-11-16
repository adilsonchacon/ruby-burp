class RbReference
  attr_accessor :link, :name
  
  def initialize(link, name)
    self.link = link
    self.name = name
  end
  
  class << self
    def parse(html)
      references = []
      html_doc = Nokogiri::HTML(html)
      html_doc.xpath('//ul/li').map do |link|
        references.push(RbReference.new(link.css('a').attribute('href').value, link.css('a').text))
      end
      
      references
    end
  end

end