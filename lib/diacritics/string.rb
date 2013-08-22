# encoding: utf-8
module Diacritics
  # Include this into String class
  module String
    # @deprecated Please use {#downcase} instead.
    def diacritics_downcase
      # rubocop:disable all
      warn '[DEPRECATION] `diacritics_downcase` is depraceted. Please use `downcase` instead.'
      # rubocop:enable all
      send :downcase
    end

    # @deprecated Please use {#upcase} instead.
    def diacritics_upcase
      # rubocop:disable all
      warn '[DEPRECATION] `diacritics_upcase` is depraceted. Please use `upcase` instead.'
      # rubocop:enable all
      send :upcase
    end

    # @deprecated Please use {#permanent} instead.
    def permanent_link
      # rubocop:disable all
      warn '[DEPRECATION] `permanent_link` is depraceted. Please use `permanent` instead.'
      # rubocop:enable all
      send :permanent
    end

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
  end
end
