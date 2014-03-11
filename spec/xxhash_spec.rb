#Copyright (c) 2012 Vasiliy Ermolovich

require 'spec_helper'
require 'stringio'
require 'yaml'

describe XXhash do
  hash = YAML.load(IO.read "spec/results.yaml")

  hash.each do |key, value|
    it 'returns correct hash' do
      XXhash.xxh32(key[0], key[1]).should eq(value)
    end
  end


  describe 'StreamingHash' do
    it 'raises error if argument is not an IO object' do
      expect { XXhash.xxh32_stream('test', 123)}.to raise_error
    end

    hash.each do |key, value|
      it 'returns correct hash' do
        XXhash.xxh32_stream(StringIO.new(key[0]), key[1]).should eq(value)
      end
    end

    it 'returns same hash for streamed files' do
      h1 = XXhash.xxh32(File.read(__FILE__), 123)
      h2 = XXhash.xxh32_stream(File.open(__FILE__), 123)
      h1.should eq(h2)
    end
  end
end
