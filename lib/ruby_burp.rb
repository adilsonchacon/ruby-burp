require 'nokogiri'

require File.join(File.dirname(__FILE__), 'ruby_burp', 'version')
require File.join(File.dirname(__FILE__), 'ruby_burp', 'rb_host')
require File.join(File.dirname(__FILE__), 'ruby_burp', 'rb_issue')
require File.join(File.dirname(__FILE__), 'ruby_burp', 'rb_request')
require File.join(File.dirname(__FILE__), 'ruby_burp', 'rb_response')
require File.join(File.dirname(__FILE__), 'ruby_burp', 'rb_reference')
require File.join(File.dirname(__FILE__), 'ruby_burp', 'rb_vulnerability_classification')

module RubyBurp

  def self.parse(path)
    issues = []
    
    doc = Nokogiri::XML(File.open(path))
    doc.xpath('//issues/issue').map do |xml_issue|
      issue = RbIssue.new
      [:serialNumber, :type, :name, :path, :location, :severity, :confidence, :issueBackground, :remediationBackground, :issueDetail].each do |field|
        issue.send("#{rb_underscore(field.to_s)}=", xml_issue.css(field.to_s).text)
      end
      
      ip = xml_issue.css('host').attribute('ip').value
      host = xml_issue.css('host').text
      issue.host = RbHost.new(ip, host)
      
      issue.references = RbReference.parse(xml_issue.css('references').text)
      issue.request = RbRequest.parse(xml_issue.to_s)
      issue.response = RbResponse.parse(xml_issue.to_s)
      issue.vulnerability_classifications = RbVulnerabilityClassification.parse(xml_issue.css('vulnerabilityClassifications').text)
      
      issues.push issue
    end
    
    return issues
  end

  def self.rb_underscore(value)
    value.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end

end
