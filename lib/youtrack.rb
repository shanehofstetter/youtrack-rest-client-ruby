require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/youtrack_client.rb")
loader.setup

module Youtrack
  # Your code goes here...
end
