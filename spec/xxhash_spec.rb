#Copyright (c) 2012 Vasiliy Ermolovich
#Copyright (c) 2014 Justin W Smith

require 'spec_helper'
require 'stringio'
require 'yaml'

describe XXhash do
  hash32 = YAML.load(IO.read "spec/results32.yaml")
  hash64 = YAML.load(IO.read "spec/results64.yaml")

  hash32.each do |key, value|
    it 'returns correct hash' do
      expect(XXhash.xxh32(key[0], key[1])).to eq(value)
    end
  end

  hash64.each do |key, value|
    it 'returns correct hash' do
      expect(XXhash.xxh64(key[0], key[1])).to eq(value)
    end
  end

  describe 'StreamingHash' do
    it 'raises error if argument is not an IO object' do
      expect { XXhash.xxh32_stream('test', 123)}.to raise_error
    end

    hash32.each do |key, value|
      it 'returns correct hash' do
        expect(XXhash.xxh32_stream(StringIO.new(key[0]), key[1])).to eq(value)
      end
    end

    it 'returns same hash for streamed files' do
      h1 = XXhash.xxh32(File.read(__FILE__), 123)
      h2 = XXhash.xxh32_stream(File.open(__FILE__), 123)
      expect(h1).to eq(h2)
    end

    it 'raises error if argument is not an IO object' do
      expect { XXhash.xxh64_stream('test', 123)}.to raise_error
    end

    hash64.each do |key, value|
      it 'returns correct hash' do
        expect(XXhash.xxh64_stream(StringIO.new(key[0]), key[1])).to eq(value)
      end
    end

    it 'returns same hash for streamed files' do
      h1 = XXhash.xxh64(File.read(__FILE__), 123)
      h2 = XXhash.xxh64_stream(File.open(__FILE__), 123)
      expect(h1).to eq(h2)
    end
  end
end
