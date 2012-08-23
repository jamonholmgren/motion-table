$:.unshift("/Library/RubyMotion/lib")
begin
  require 'bundler'
  Bundler.setup
rescue LoadError
  $stderr.puts "You need to have Bundler installed to build the gem"
end

require "bundler/gem_tasks"
require 'motion/project'
