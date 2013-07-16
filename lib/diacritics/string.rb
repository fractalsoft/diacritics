# encoding: utf-8
class String
  alias_method :old_downcase, :downcase
  alias_method :old_upcase, :upcase
end

module Diacritics
  module String
    def diacritics_downcase
      Diacritics::Cases.instance.downcase self
    end

    def diacritics_upcase
      Diacritics::Cases.instance.upcase self
    end

    def permanent_link
      Diacritics::Cases.instance.permanent self
    end
  end
end
