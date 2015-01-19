# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :ar_test => :environment do
  def assert(actual, expected)
    raise "Expected #{actual} to equal #{expected}" unless actual == expected
  end

  def assert_not(actual, expected)
    raise "Expected #{actual} to not equal #{expected}" unless actual != expected
  end

  Martian.delete_all
  Earthling.delete_all
  Abduction.delete_all

  marvin = Martian.create! :name => 'Marvin'
  may = Martian.create! :name => 'May'
  billy = Earthling.create! :name => 'Billy'
  eddy  = Earthling.create! :name => 'Eddy'

  success = marvin.abduct(billy)
  assert(success, true)
  assert(Abduction.all.count, 1)

  success = may.abduct(billy)
  assert(success, true)
  assert(Abduction.all.count, 2)

  assert(marvin.abduct(eddy), true)
  assert(marvin.abduct(eddy), true)

  ### Make sure the abduction persisted correctly
  billy = Earthling.find_by(name: 'Billy')
  assert_not(billy, nil)
  assert(billy.abductions.count, 2)
  assert(billy.abductions.first.martian.name, 'Marvin') #added ".first" here; but may not be the issue

  marvin = Martian.find_by(name: 'Marvin')
  assert_not(marvin, nil)
  assert(marvin.abductions.count, 3)
  assert(marvin.abductions.first.earthling.name, 'Billy') #added ".first" here also

  ### Make sure your code follows martian law
  success = marvin.abduct(billy)
  assert(success, false)
  assert(Abduction.all.count, 4)

  assert  may.abduct(billy),   false
  assert  may.abduct(eddy),    false
  assert  marvin.abduct(eddy), false

  assert(Abduction.all.count, 4)

  puts "All good!"
end