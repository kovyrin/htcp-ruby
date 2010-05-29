require 'socket'

module Htcp
  class Client
    def initialize(servers_list)
      @servers = servers_list
    end
  
    def clr(url, headers = '')
      message = Htcp::Message::Constructor.new(
        :opcode => 4, # CLR
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
      return server if server.kind_of?(Array)
      return server, 4827
    end
  end
end
