# encoding: utf-8
module Diacritics
  # Include this into String class
  module String
    def self.included(klass)
      klass.class_eval do
        def downcase
          Diacritics::Cases.instance.downcase self
        end

        def upcase
          Diacritics::Cases.instance.upcase self
        end
      end
    end

    def permanent
      Diacritics::Cases.instance.permanent self
    end

    def permanent?
      Diacritics::Cases.instance.permanent(self) == self
    end

    def slug?
      !match(/^[[:alnum:][_-]]+$/).nil?
    end
  end
end
