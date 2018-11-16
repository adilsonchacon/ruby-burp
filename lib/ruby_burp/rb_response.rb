class RbResponse
  attr_accessor :base64, :text, :redirected

  def initialize(base64, text, redirected)
    self.base64 = base64
    self.text = text
    self.redirected = redirected
  end

  class << self
    def parse(xml)
      responses = []
      html_doc = Nokogiri::XML(xml)
      res = html_doc.xpath('//requestresponse//response').first      
      begin
        redirected = html_doc.xpath('//requestresponse//responseRedirected').first.text
      rescue
        redirected = ''
      end

      begin
        base64 = res.attribute('base64').value
      rescue
        base64 = ''
      end

      begin
        res = res.text
      rescue
        res = ''
      end      
      
      responses.push(RbResponse.new(base64, res, redirected))
      
      responses
    end
  end
end