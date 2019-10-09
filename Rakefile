require 'rake'
require 'rspec/core/rake_task'
require 'bundler/setup'

RSpec::Core::RakeTask.new(:spec) do |t|
  # t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation --require spec_helper --require checkout'
end
task default: :spec
