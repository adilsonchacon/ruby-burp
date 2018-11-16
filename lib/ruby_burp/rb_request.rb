class RbRequest
  attr_accessor :method, :base64, :text

  def initialize(method, base64, text)
    self.method = method
    self.base64 = base64
    self.text = text
  end

  class << self
    def parse(xml)
      requests = []
      html_doc = Nokogiri::XML(xml)
      
      req = html_doc.xpath('//requestresponse/request').first
      
      begin
        method = req.attribute('method').value
      rescue
        method = ''
      end

      begin
        base64 = req.attribute('base64').value
      rescue
        base64 = ''
      end
      
      begin
        req = req.text
      rescue
        req = ''
      end  

      requests.push(RbRequest.new(method, base64, req))
      
      requests
    end
  end
end