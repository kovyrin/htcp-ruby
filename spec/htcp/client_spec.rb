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
end
