module Htcp
  module Message
    class Data < Htcp::Message::Base
      def initialize(params)
        @params = params    
      end
  
      def to_s
        # Process data fields
        @params[:rr] = @params[:response] ? 1 : 0
        @params[:response] ||= 0
        @params[:f1] = @params[:rr] == 0 ? @params[:rd] : @params[:mo]

#        puts @params.inspect
        # Compose request
        request = ''
    
        request << encode_int8(@params[:response] << 4 | @params[:opcode])
        request << encode_int8((@params[:f1] << 1) | @params[:rr])
        request << encode_int32(@params[:trans_id])
        request << @params[:op_data].to_s
    
        # Encode request with string
        encode_int16(request.length + 2) + request
      end
    end
  end
end
