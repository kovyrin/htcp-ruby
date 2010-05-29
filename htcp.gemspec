# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{htcp}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexey Kovyrin"]
  s.date = %q{2010-05-29}
  s.default_executable = %q{htcp-client}
  s.description = %q{This simple library implements HTCP protocol (www.htcp.org/) and could be used in any Ruby project to manage any HTCP-compliant caching server (authors use it for Squid 2.7 servers management).}
  s.email = %q{alexey@kovyrin.net}
  s.executables = ["htcp-client"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "bin/htcp-client",
     "init.rb",
     "lib/htcp.rb",
     "lib/htcp/autoload.rb",
     "lib/htcp/client.rb",
     "lib/htcp/message/auth.rb",
     "lib/htcp/message/base.rb",
     "lib/htcp/message/constructor.rb",
     "lib/htcp/message/data.rb",
     "lib/htcp/message/header.rb",
     "lib/htcp/message/op_data/clr.rb",
     "lib/htcp/message/specifier.rb"
  ]
  s.homepage = %q{http://github.com/kovyrin/htcp-ruby}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{HTCP Protocol Client implemented in Ruby}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
