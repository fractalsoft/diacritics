# encoding: utf-8

# Diacritics private class
module Diacritics
  private

  # Characters from many alphabets
  # Get from https://en.wikipedia.org/wiki/Diacritic
  class Alphabet
    attr_reader :regexp, :hash

    def initialize
      @downcase, @upcase, @permanent = [], [], []
      prepare_alphabet
      @hash, @regexp = prepare_hash, prepare_regexp
    end

    private

    def prepare_alphabet
      data.each_pair do |_language, hash|
        @downcase += hash[:downcase]
        @upcase += hash[:upcase]
        @permanent += hash[:permanent]
      end
    end

    def prepare_hash
      class_name = Diacritics::Alphabet
      hash = class_name.hashed(@downcase, @upcase)
      one = class_name.hashed(@downcase, @permanent)
      two = class_name.hashed(@upcase, @permanent)
      {
        downcase: hash.invert,
        upcase: hash,
        permanent: one.merge(two)
      }
    end

    def prepare_regexp
      downcase = @upcase.join
      upcase = @downcase.join
      permanent = (@downcase + @upcase).uniq.join
      {
        downcase: /[#{downcase}]/,
        upcase: /[#{upcase}]/,
        permanent: /[#{permanent}]/
      }
    end

    # Creates a hash from two arrays
    #
    #   ["a", "b"], ["A", "B"] #=> {"a" => "A", "b" => "B"}
    def self.hashed(one, two)
      Hash[one.zip two]
    end

    def data
      languages.each_with_object({}) do |language, hash|
        hash[language] = send(language)
      end
    end

    def languages
      [:en, :de, :pl, :cs, :fr, :it, :eo, :is, :pt, :sp, :hu, :nn, :ru, :gr]
    end

    def en
      { # English
        downcase:  [' ', '!', ',', '.', ':', '?', '«', '»'],
        upcase:    [' ', '!', ',', '.', ':', '?', '«', '»'],
        permanent: ['-', '', '', '', '', '', '', '']
      }
    end

    def de
      { # German
        downcase:  %w(ä ö ü ß),
        upcase:    %w(Ä Ö Ü ẞ),
        permanent: %w(ae oe ue ss)
      }
    end

    def pl
      { # Polish
        downcase:  %w(ą ć ę ł ń ó ś ż ź),
        upcase:    %w(Ą Ć Ę Ł Ń Ó Ś Ż Ź),
        permanent: %w(a c e l n o s z z)
      }
    end

    def cs
      { # Czech uses acute (á é í ó ú ý), caron (č ď ě ň ř š ť ž), ring (ů)
        # aábcčdďeéěfghiíjklmnňoópqrřsštťuúůvwxyýzž
        # AÁBCČDĎEÉĚFGHIÍJKLMNŇOÓPQRŘSŠTŤUÚŮVWXYÝZŽ
        downcase:  %w(á é í ó ú ý č ď ě ň ř š ť ů ž),
        upcase:    %w(Á É Í Ó Ú Ý Č Ď Ě Ň Ř Š Ť Ů Ž),
        permanent: %w(a e i o u y c d e n r s t u z)
      }
    end

    def fr
      { # French
        # abcdefghijklmnopqrstuvwxyzàâæçéèêëîïôœùûüÿ
        # ABCDEFGHIJKLMNOPQRSTUVWXYZÀÂÆÇÉÈÊËÎÏÔŒÙÛÜŸ
        downcase:  %w(à â é è ë ê ï î ô ù û ü ÿ ç œ æ),
        upcase:    %w(À Â É È Ë Ê Ï Î Ô Ù Û Ü Ÿ Ç Œ Æ),
        permanent: %w(a a e e e e i i o u u ue y c oe ae)
      }
    end

    def it
      { # Italian
        downcase:  %w(à è é ì î ò ó ù),
        upcase:    %w(À È É Ì Î Ò Ó Ù),
        permanent: %w(a e e i i o o u)
      }
    end

    def eo
      { # Esperantohas the symbols ŭ, ĉ, ĝ, ĥ, ĵ and ŝ
        downcase:  %w(ĉ ĝ ĥ ĵ ŝ ŭ),
        upcase:    %w(Ĉ Ĝ Ĥ Ĵ Ŝ Ŭ),
        permanent: %w(c g h j s u)
      }
    end

    def is
      { # Iceland
        downcase:  %w(ð þ),
        upcase:    %w(Ð Þ),
        permanent: %w(d p)
      }
    end

    def pt
      { # Portugal uses á, â, ã, à, ç, é, ê, í, ó, ô, õ and ú
        downcase:  %w(ã ç),
        upcase:    %w(Ã Ç),
        permanent: %w(a c)
      }
    end

    def sp
      { # Spanish
        downcase:  ['ñ', 'õ', '¿', '¡'],
        upcase:    ['Ñ', 'Õ', '¿', '¡'],
        permanent: ['n', 'o', '', '']
      }
    end

    def hu
      { # Hungarian
        downcase:  %w(ő),
        upcase:    %w(Ő),
        permanent: %w(oe)
      }
    end

    def nn
      { # Norwegian
        downcase:  %w(æ å),
        upcase:    %w(Æ Å),
        permanent: %w(ae a)
      }
    end

    def ru
      { # Russian
        downcase: %w(
          а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш ы ь ю я),
        upcase: %w(
          А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Ы Ь Ю Я),
        permanent: %w(
          а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш ы ь ю я)
      }
    end

    def gr
      { # Greek
        downcase: %w(α ά γ δ ε έ ζ η θ ι ί κ λ μ ν ξ ο ό π ρ σ τ υ φ ψ),
        upcase:   %w(Α Ά Γ Δ Ε Έ Ζ Η Θ Ι Ί Κ Λ Μ Ν Ξ Ο Ό Π Ρ Σ Τ Υ Φ Ψ),
        permanent: %w(
          a a g d e e z e th i i k l m n x o o p r s t y ph ps)
      }
    end
  end
end
