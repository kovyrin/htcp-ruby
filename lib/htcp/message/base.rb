module Htcp
  module Message
    class Base
      # Put 16-bit int(s) to request.
      def encode_int8(*ints)
        request = ''
        ints.each { |i| request << [i].pack('C') }
        return request
      end

      # Put 16-bit int(s) to request.
      def encode_int16(*ints)
        request = ''
        ints.each { |i| request << [i].pack('n') }
        return request
      end

      # Put 32-bit int(s) to request.
      def encode_int32(*ints)
        request = ''
        ints.each { |i| request << [i].pack('N') }
        return request
      end

      # Put string(s) to request (first length, then the string itself).
      def encode_string(*strings)
        request = ''
        strings.each { |s| request << encode_int16(s.length) + s }
        return request
      end
    end
  end
end
