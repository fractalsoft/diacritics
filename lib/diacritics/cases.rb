# encoding: utf-8

# String core class
class String
  alias_method :old_downcase, :downcase
  alias_method :old_upcase, :upcase
end

# Diacritics classes
module Diacritics
  # Downcase or upcase with diacritics support
  class Cases
    def self.instance
      @instance ||= new
    end

    def initialize
      alphabet = Diacritics::Alphabet.new
      @hash = alphabet.hash
      @regexp = alphabet.regexp
    end

    def downcase(text)
      text.old_downcase.gsub @regexp[:downcase], @hash[:downcase]
    end

    def upcase(text)
      text.old_upcase.gsub @regexp[:upcase], @hash[:upcase]
    end

    def permanent(text)
      text.old_downcase.gsub @regexp[:permanent], @hash[:permanent]
    end
  end
end
