# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'checkout'
  s.version = '0.0.1'
  s.date = '2019-10-08'
  s.summary = 'Novicap Checkout Class'
  s.author = 'Al Bobrov'
  s.email = 'al.bobrov.mail@gmail.com'
  s.files = Dir['README.md', 'lib/**/*', 'config/**/*']
  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.6.0'

  s.add_dependency 'i18n', '~> 1.6.0'

  s.add_development_dependency 'pry', '~> 0.12.2'
  s.add_development_dependency 'rspec', '~> 3.8.2'
end
