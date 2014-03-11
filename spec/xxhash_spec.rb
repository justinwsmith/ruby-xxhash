#Copyright (c) 2012 Vasiliy Ermolovich

require 'spec_helper'
require 'stringio'

describe XXhash do
  it 'returns correct hash' do
     XXhash.xxh32('test', 123).should eq(2758658570)
  end

  it 'returns correct hash' do
     XXhash.xxh32("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ").should eq(0x1130e7d4)
  end

  it 'returns correct hash' do
     XXhash.xxh32("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, ", 1471).should eq(0xba59a258)
  end

  describe 'StreamingHash' do
    it 'raises error if argument is not an IO object' do
      expect { XXhash.xxh32_stream('test', 123)}.to raise_error
    end

    it 'returns the correct hash for streamed strings' do
      XXhash.xxh32_stream(StringIO.new('test'), 123).should eq(2758658570)
    end

    it 'returns the correct hash for streamed strings' do
      XXhash.xxh32_stream(StringIO.new("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, "), 1471).should eq(0xba59a258)
    end

    it 'returns same hash for streamed files' do
      h1 = XXhash.xxh32(File.read(__FILE__), 123)
      h2 = XXhash.xxh32_stream(File.open(__FILE__), 123)
      h1.should eq(h2)
    end
  end
end
