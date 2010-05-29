require 'socket'

module Htcp
  class Client
    DEFAULT_PORT = 4827

    def initialize(*servers_list)
      @servers = servers_list.flatten
    end
  
    def clr(url, headers = '')
      message = Htcp::Message::Constructor.new(
        :opcode => Htcp::Message::OpData::Clr::OP_CODE,
        :rd => 0,
        :trans_id => Time.now.to_i,
        :op_data => Htcp::Message::OpData::Clr.new(:uri => url, :headers => headers)
      )
      send_messages(message)
    end
  
  private
  
    def send_messages(message)
      message = message.to_s
      @servers.each { |s| send_message(s, message) }
    end
    
    def send_message(server, message)
      host, port = parse_server(server)
      UDPSocket.new.send(message, 0, host, port)
    end
    
    def parse_server(server)
      host, port = server.split(':')
      port = port.to_i
      port = DEFAULT_PORT if port.zero?
      return host, port
    end
  end
end
