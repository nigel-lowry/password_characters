require "password_characters/version"

require 'set'

require 'active_support'
require 'active_support/core_ext/object'

module PasswordCharacters
  class PasswordAndOrdinals
    def initialize(password, ordinals)
      raise(ArgumentError, "#{ordinals} does not ask for any characters") if ordinals.empty?
      raise(ArgumentError, "#{ordinals} only asks for one character") if ordinals.one?

      raise(ArgumentError, "#{ordinals} is not in ascending order") unless sorted?(ordinals)

      raise(ArgumentError, "#{ordinals.uniq.to_sentence} duplicated in #{ordinals}") unless uniq?(ordinals)
      raise(ArgumentError, "#{ordinals} would reveal entire password") unless ordinals.size < password.size # needs to come after checking duplicates

      raise(ArgumentError, "#{ordinals_out_of_bounds(password, ordinals).to_sentence} out of bounds") unless ordinals.all? { |i| i.in? ordinal_range(password) }

      @password_array = password.chars
      @indices = indices ordinals
    end

    def characters
      @indices.map { |i| @password_array.at i }
    end

    private

    def sorted?(a)
      a.sort == a
    end

    def uniq?(a)
      a.uniq == a
    end

    def ordinals_out_of_bounds(password, ordinals)
      ordinals.reject { |i| i.in? ordinal_range(password) }
    end

    def ordinal_range(password)
      1..password.length
    end

    def indices(ordinals)
      ordinals.map { |n| n - 1 }
    end
  end

  class OrdinalParser
    def initialize(string, password=nil)
      @input = string
      @password = password
    end

    def ordinal
      case @input
        when /the last/
          @password.length
        when /second (from|to) last/
          @password.length - 1
        when /third from last/
          @password.length - 2
        when /fourth from last/
          @password.length - 3
        when /first/
          1
        when /second/
          2
        when /third/
          3
        when /fourth/
          4
        else
          @input[/\d+/].to_i
      end
    end
  end
end