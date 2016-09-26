class Entities
  VERSION = "0.1"

  # /*  Takes input from <src> and decodes into <dest>, which should be a buffer
  #   large enough to hold <strlen(src) + 1> characters.

  #   If <src> is <NULL>, input will be taken from <dest>, decoding
  #   the entities in-place.

  #   The function returns the length of the decoded string.
  # */
  @[Link(ldflags: "#{__DIR__}/ext/entities-c/entities.o")]
  lib Lib
    fun decode_html_entities_utf8(dest : UInt8*, src : UInt8*) : LibC::SizeT
  end

  def initialize(@string : String)
  end

  def decode
    String.new(@string.bytesize + 1) do |buffer|
      res = Lib.decode_html_entities_utf8(buffer, @string.to_unsafe)
      {res, 0}
    end
  end
end
