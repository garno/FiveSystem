spec = Gem::Specification.new do |s|
  s.name         = "five_system"
  s.version      = "0.1.0"
  s.platform     = Gem::Platform::RUBY
  s.authors      = "Samuel Garneau"
  s.email        = "samgarneau@gmail.com"
  s.summary      = "Unix toolbox for retrieving system information."
  s.files        = Dir["lib/**/*.rb", "README.md"]
  s.require_path = "lib"
end
