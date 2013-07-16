# encoding: utf-8
module Diacritics
  private
    # Characters from many alphabets
    class Alphabet
      attr_reader :regexp, :hash

      def initialize
        @downcase, @upcase, @permanent = [], [], []
        prepare_alphabet
        @hash, @regexp = prepare_hash, prepare_regexp
      end

      private
        def prepare_alphabet
          data.each_pair do |language, hash|
            @downcase += hash[:downcase]
            @upcase += hash[:upcase]
            @permanent += hash[:permanent]
          end
        end

        def prepare_hash
          klass = Diacritics::Alphabet
          hash = klass.hashed(@downcase, @upcase)
          one = klass.hashed(@downcase, @permanent)
          two = klass.hashed(@upcase, @permanent)
          {
            downcase: hash.invert,
            upcase: hash,
            permanent: one.merge(two),
          }
        end

        def prepare_regexp
          downcase, upcase = @upcase.join, @downcase.join
          permanent = (@downcase + @upcase).uniq.join
          {
            downcase: /[#{downcase}]/,
            upcase: /[#{upcase}]/,
            permanent: /[#{permanent}]/,
          }
        end

        # Creates a hash from two arrays
        #
        #   ["a", "b"], ["A", "B"] #=> {"a" => "A", "b" => "B"}
        def self.hashed(one, two)
          hash = {}
          [one, two].transpose.each { |key, value| hash[key] = value }
          hash
        end

        def data
          {
            en: { # English
              downcase:  [' ', '?', '.', ','],
              upcase:    [' ', '?', '.', ','],
              permanent: ['-', '',  '', ''],
            },
            de: { # German
              downcase:  %w[ä  ö  ü  ß],
              upcase:    %w[Ä  Ö  Ü  ẞ],
              permanent: %w[ae oe ue ss]
            },
            pl: { # Polish
              downcase:  %w[ą ć ę ł ń ó ś ż ź],
              upcase:    %w[Ą Ć Ę Ł Ń Ó Ś Ż Ź],
              permanent: %w[a c e l n o s z z]
            },
            cs: { # Czech [Ď, Ě, Ň, Ť, Ů, Ú, Û]
              downcase:  %w[á č í ř š ý ž],
              upcase:    %w[Á Č Í Ř Š Ý Ž],
              permanent: %w[a c i r s y z]
            },
            fr: { # French [Œ, Ÿ, Î, Ï]
              downcase:  %w[à é è ê ô],
              upcase:    %w[À É È Ê Ô],
              permanent: %w[a e e e o]
            },
            it: { # Italian
              downcase:  %w[ì ù ò],
              upcase:    %w[Ì Ù Ò],
              permanent: %w[i u o]
            },
            eo: { # Esperanto
              downcase:  %w[ĉ ĝ ĥ ĵ ŝ ŭ],
              upcase:    %w[Ĉ Ĝ Ĥ Ĵ Ŝ Ŭ],
              permanent: %w[c g h j s u]
            },
            is: { # Iceland
              downcase:  %w[ð þ],
              upcase:    %w[Ð Þ],
              permanent: %w[d p]
            },
            pt: { # Portugal [Â]
              downcase:  %w[ã ç],
              upcase:    %w[Ã Ç],
              permanent: %w[a c]
            },
            sp: { # Spanish
              downcase:  ['¿'],
              upcase:    ['¿'],
              permanent: ['']
            },
            hu: { # Hungarian
              downcase:  %w[ő],
              upcase:    %w[Ő],
              permanent: %w[oe]
            },
            nn: { # Norwegian
              downcase:  %w[æ å],
              upcase:    %w[Æ Å],
              permanent: %w[ae a]
            },
            ru: { # Russian [Щ, Ъ, Э]
              downcase: %w[
                а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш ы ь ю я
              ],
              upcase: %w[
                А Б В Г Д Е Ё Ж З И Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Ы Ь Ю Я
              ],
              permanent: %w[
                а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш ы ь ю я
              ]
            },
            gr: { # Greek [Β, Μ, Χ, Ω, Ή, Ύ, Ώ, ΐ, ΰ, Ϊ, Ϋ]
              downcase: %w[α ά γ δ ε έ ζ η θ ι ί κ λ μ ν ξ ο ό π ρ σ τ υ φ ψ],
              upcase:   %w[Α Ά Γ Δ Ε Έ Ζ Η Θ Ι Ί Κ Λ Μ Ν Ξ Ο Ό Π Ρ Σ Τ Υ Φ Ψ],
              permanent: %w[
                a a g d e e z e th i i k l m n x o o p r s t y ph ps
              ]
            }
          }
        end
    end
end
