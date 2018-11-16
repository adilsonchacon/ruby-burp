class RbHost
  attr_accessor :ip, :host
  
  def initialize(ip, host)
    self.ip = ip
    self.host = host
  end
end