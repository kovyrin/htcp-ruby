module Htcp
  module Autoload
    # @private
    def self.__p(*path) File.join(Htcp::LIB_ROOT, 'htcp', *path) end
  end
  include Autoload
  
  # Define autoloaded modules/classes
  autoload :Client,         __p('client')
  
  module Message
    include Autoload

    autoload :Base,         __p('message/base')
    autoload :Constructor,  __p('message/constructor')

    autoload :Auth,         __p('message/auth')
    autoload :Data,         __p('message/data')
    autoload :Header,       __p('message/header')
    autoload :Specifier,    __p('message/specifier')
    
    module OpData
      include Autoload
      
      autoload :Clr,        __p('message/op_data/crl')
    end
  end
end
