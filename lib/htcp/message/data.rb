module Htcp
  module Message
    class Data < Htcp::Message::Base
      def initialize(params)
        @params = params
      end
  
      def to_s
        # Process data fields
        rr = @params[:response] ? 1 : 0
        response_code = @params[:response] || 0
        f1 = (rr.zero?) ? @params[:rd] : @params[:mo]

        # Compose request
        request = ''

        request << encode_int8(response_code << 4 | @params[:opcode])
        request << encode_int8((f1 << 1) | rr)
        request << encode_int32(@params[:trans_id])
        request << @params[:op_data].to_s

        # Encode request with string
        encode_int16(request.length + 2) + request
      end
    end
  end
end
