require 'spec_helper'

describe Htcp::Client do
  context "in constructor" do
    it "should accept one server" do
      Htcp::Client.new('foo')
    end

    it "should accept a list of servers" do
      Htcp::Client.new('foo', 'bar')
    end

    it "should accept an array of servers" do
      Htcp::Client.new(['foo', 'bar'])
    end

    it "should accept alist of arrays of servers" do
      Htcp::Client.new(['foo', 'bar'], 'baz', ['blah'])
    end
  end
  
  context "in parse_server method" do
    before do
      @htcp = Htcp::Client.new('foo')
    end

    it "should accept a 'host:port' server format" do
      @htcp.send(:parse_server, 'foo:123').should == [ 'foo', 123 ]
    end

    it "should accept a 'host' server format" do
      @htcp.send(:parse_server, 'foo').should == [ 'foo', Htcp::Client::DEFAULT_PORT ]
    end

    it "should accept a 'host:invalid_port' server format" do
      @htcp.send(:parse_server, 'foo:blah').should == [ 'foo', Htcp::Client::DEFAULT_PORT ]
    end
  end
  
  context "in clr method" do
    before do
      @htcp = Htcp::Client.new('127.0.0.1')
    end
    
    context "when called without additional headers" do
      it "should compose a CLR request and try to send it out" do
        @htcp.should_receive(:send_messages)
        @htcp.clr('http://www.blah.com/foo/bar?baz=blah')
      end
    end
    
    context "when called with additional headers" do
      it "should compose a CLR request and try to send it out" do
        @htcp.should_receive(:send_messages)
        @htcp.clr('http://www.blah.com/foo/bar?baz=blah', 'Foo: bar')
      end
    end
  end
  
  context "in send_message method" do
    it "should send the message out to one server when only one server specified" do
      htcp = Htcp::Client.new('127.0.0.1')
      htcp.should_receive(:send_message).once
      htcp.clr('http://www.blah.com/foo/bar?baz=blah')
    end

    it "should send the message out to all servers when many servers specified" do
      htcp = Htcp::Client.new('127.0.0.1', '127.0.0.2')
      htcp.should_receive(:send_message).twice
      htcp.clr('http://www.blah.com/foo/bar?baz=blah')
    end
  end
end
