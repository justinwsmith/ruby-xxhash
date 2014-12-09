# Copyright 2014 Justin W. Smith

require "ruby-xxhash/version"
require "ruby-xxhash32"
require "ruby-xxhash64"

class XXhash
  def XXhash.xxh32(input, seed = 0)
    xxh = XXhash32.new(seed)
    xxh.feed(input)
    xxh.sum32
  end

  def XXhash.xxh32_stream(io, seed = 0, chunk = 32)
    xxh = XXhash32.new(seed)

    while(data = io.read(chunk))
      xxh.feed(data)
    end

    xxh.sum32
  end

  def XXhash.xxh64(input, seed = 0)
    xxh = XXhash64.new(seed)
    xxh.feed(input)
    xxh.sum64
  end

  def XXhash.xxh64_stream(io, seed = 0, chunk = 32)
    xxh = XXhash64.new(seed)

    while(data = io.read(chunk))
      xxh.feed(data)
    end

    xxh.sum64
  end

end