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
end
