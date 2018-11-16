$:.push File.expand_path("../lib", __FILE__)
require 'ruby_burp/version'

Gem::Specification.new do |s|
  s.name = "ruby_burp"
  s.version = RubyBurp::VERSION
  s.platform = Gem::Platform::RUBY
  s.licenses = ['MIT']
  s.authors = ["Adilson Chacon"]
  s.email = ["adilsonchacon@gmail.com"]
  s.homepage = %q{https://github.com/adilsonchacon/ruby_burp}
  s.summary = "Ruby Burp Parser"
  s.description = "Parses Burp Scanner XML file"
  s.date = Time.now

  s.files = Dir["{lib}/**/*"]
  s.require_paths = ["lib"]
end