require 'rake'
require 'rspec/core/rake_task'
require 'bundler/setup'

RSpec::Core::RakeTask.new(:spec) do |t|
  # t.pattern = Dir.glob('spec/**/*_spec.rb')
  t.rspec_opts = '--format documentation --require spec_helper --require checkout'
end
task default: :spec

task :console do
  require 'irb'
  require './lib/checkout'

  ARGV.clear
  puts '---- Checkout Novicap Console --------'
  puts '--------------------------------------'
  puts ''
  puts 'Current checkout default Rule Classes:'
  puts Checkout.new.default_rules
  puts ''
  puts ''
  puts 'Example usage:'
  puts '    co = Checkout.new([Rules::BulkTshirt, Rules::BuyTwoGetOne])
    co.scan("VOUCHER")
    co.scan("VOUCHER")
    co.scan("TSHIRT")
    price = co.total'
  IRB.start
end
