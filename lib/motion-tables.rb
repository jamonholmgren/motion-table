unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require "motion-table/version"

Motion::Project::App.setup do |app|
  Dir.glob(File.join(File.dirname(__FILE__), "motion-table/*.rb")).each do |file|
    app.files.unshift(file)
  end
end