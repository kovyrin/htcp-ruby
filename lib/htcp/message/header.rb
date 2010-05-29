module Htcp
  module Message
    class Header < Htcp::Message::Base
      attr_accessor :payload_len
  
      def initialize(params)
        @params = {
          :major => 0,
          :minor => 0
        }.merge(params)

        @payload_len = 0
      end
  
      def to_s
        encode_int16(@payload_len + 4) + encode_int8(@params[:major], @params[:minor])
      end
    end
  end
end
