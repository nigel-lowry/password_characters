require 'set'
require 'active_support/all'

class PasswordAndOrdinals
  def initialize password, character_ordinals
    raise(ArgumentError, "#{character_ordinals.uniq.to_sentence} duplicated in #{character_ordinals}") unless uniq?(character_ordinals)
    raise(ArgumentError, "#{character_ordinals} is not in ascending order") unless sorted?(character_ordinals)
    raise(ArgumentError, "#{character_ordinals} would reveal entire password") unless character_ordinals.size < password.size
    raise(ArgumentError, "#{ordinals_out_of_bounds(password, character_ordinals).to_sentence} out of bounds") unless character_ordinals.all? { |i| i.in? ordinal_range(password) }
    raise(ArgumentError, "#{character_ordinals} only asks for one character") if character_ordinals.one?

    @password_array = password.chars
    @indices = indices character_ordinals
  end

  def characters
    @indices.map { |index| @password_array[index] }
  end

  private

  def uniq? a
    a.uniq == a
  end

  def sorted? a
    a.sort == a
  end

  def ordinals_out_of_bounds password, ordinals
    ordinals.reject { |i| i.in? ordinal_range(password) }
  end

  def ordinal_range password
    1..password.length
  end

  def indices character_ordinals
    character_ordinals.map { |n| n - 1 }
  end
end