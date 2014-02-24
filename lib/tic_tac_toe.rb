Dir["#{File.dirname(__FILE__)}/../app/actions/**/*.rb"].each do |file|
  require file
end
