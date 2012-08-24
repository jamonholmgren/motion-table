# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-table/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["ClearSight Studio"]
  gem.email         = ["contact@clearsightstudio.com"]
  gem.description   = "MotionTable is a RubyMotion gem that makes it easy to handle UITableViews from a UITableViewController."
  gem.summary       = "MotionTable is a RubyMotion gem that makes it easy to handle UITableViews from a UITableViewController. Simply include in the module in your controller."
  gem.homepage      = "https://github.com/clearsightstudio/motion-table"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "motion-table"
  gem.require_paths = ["lib"]
  gem.version       = MotionTable::VERSION
end
