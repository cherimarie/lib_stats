Gem::Specification.new do |s|
  s.name        = 'lib_stats'
  s.version     = '0.0.7'
  s.date        = '2012-12-11'
  s.summary     = "Performance statistics for libraries"
  s.description = "A gem to track the performance of different categories of books in a library"
  s.authors     = ["Cheri Allen"]
  s.email       = 'cherimarie@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/lib_stats'
  s.files       = ["lib/lib_stats.rb",
                  "lib/lib_stats/category.rb",
                  "lib/lib_stats/categorybuilder.rb",
                  "lib/lib_stats/csvreader.rb",
                  "lib/lib_stats/library.rb"]
s.require_paths = ["lib"]

  s.add_runtime_dependency "require_relative"

end