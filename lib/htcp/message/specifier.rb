module Htcp
  module Message
    class Specifier < Htcp::Message::Base
      def initialize(params)
        @params = params
      end

      def to_s
        request = ''
    
        request << encode_string(@params[:method] || 'GET')
        request << encode_string(@params[:uri])
        request << encode_string(@params[:version] || 'HTTP/1.1')
        request << encode_string(@params[:headers] || '')
    
        return request
      end
    end
  end
end
