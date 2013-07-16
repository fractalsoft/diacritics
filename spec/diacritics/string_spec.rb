# encoding: utf-8
require 'spec_helper'

describe Diacritics::String do
  class String
    include Diacritics::String
  end

  context "#diacritics_downcase" do
    it "downcase String with diacritics" do
      string = "ŁoreM Ìpsum Ðolór. Šit Ämet"
      result = "łorem ìpsum ðolór. šit ämet"

      string.diacritics_downcase.should eq(result)
    end
  end

  context "#diacritics_upcase" do
    it "upcase String with diacritics" do
      string = "łorem ìpsum ðolÓr. šit ämet"
      result = "ŁOREM ÌPSUM ÐOLÓR. ŠIT ÄMET"

      string.diacritics_upcase.should eq(result)
    end
  end

  context "#permanent_link" do
    it "permanent String with diacritics" do
      string = "Łorem ìpsum ÐolÓr. Šit ämet"
      result = "lorem-ipsum-dolor-sit-aemet"

      string.permanent_link.should eq(result)
    end
  end
end