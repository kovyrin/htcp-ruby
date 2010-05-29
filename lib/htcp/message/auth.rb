module Htcp
  module Message
    class Auth < Htcp::Message::Base
      def initialize(params)
        # Not implemented
      end
  
      def to_s
        encode_int16(2)
      end
    end
  end
end
