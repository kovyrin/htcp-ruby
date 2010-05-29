module Htcp
  module Message
    module OpData
      class Clr < Htcp::Message::Base
        OP_CODE = 4

        def initialize(params)
          @specifier = Htcp::Message::Specifier.new(params)
        end

        def to_s
          encode_int16(0) + @specifier.to_s
        end
      end
    end
  end
end
