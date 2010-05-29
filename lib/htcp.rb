module Htcp
  # @return [String]
  #   a full path to the loops "lib" directory.
  LIB_ROOT = File.expand_path(File.dirname(__FILE__)) unless const_defined?('LIB_ROOT')
end

require File.join(Htcp::LIB_ROOT, 'htcp/autoload')
