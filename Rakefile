begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name        = 'htcp'
    gemspec.summary     = 'HTCP Protocol Client implemented in Ruby'
    gemspec.description = 'This simple library implements HTCP protocol (www.htcp.org/) and could be used in any Ruby project to manage any HTCP-compliant caching server (authors use it for Squid 2.7 servers management).'
    gemspec.email       = 'alexey@kovyrin.net'
    gemspec.homepage    = 'http://github.com/kovyrin/htcp-ruby'
    gemspec.authors     = ['Alexey Kovyrin']
    gemspec.files.include ['lib/**/*']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts 'Jeweler not available. Install it with: sudo gem install jeweler'
end
