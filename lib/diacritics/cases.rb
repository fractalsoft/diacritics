# encoding: utf-8
module Diacritics
  # Downcase or upcase with diacritics support
  class Cases
    def self.instance
      @instance ||= new
    end

    def initialize
      @alphabet = Diacritics::Alphabet.new
      @hash, @regexp = @alphabet.hash, @alphabet.regexp
    end

    def downcase(text)
      text.downcase.gsub @regexp[:downcase], @hash[:downcase]
    end

    def upcase(text)
      text.upcase.gsub @regexp[:upcase], @hash[:upcase]
    end

    def permanent(text)
      text.downcase.gsub @regexp[:permanent], @hash[:permanent]
    end
  end
end
