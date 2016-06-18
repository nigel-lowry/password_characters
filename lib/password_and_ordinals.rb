require 'set'

require 'active_support'
require 'active_support/core_ext/object'

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