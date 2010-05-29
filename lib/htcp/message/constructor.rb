module Htcp
  module Message
    class Constructor
      def initialize(params)
        @header = Htcp::Message::Header.new(params[:head] || {})
        @data = Htcp::Message::Data.new(params[:data] || params)
        @auth = Htcp::Message::Auth.new(params[:auth] || {})
      end
    
      def to_s
        payload = @data.to_s + @auth.to_s
        @header.payload_len = payload.length
        @header.to_s + payload
      end
    end
  end
end
