require 'set'
require 'active_support/all'

class PasswordAndOrdinals
  def initialize password, character_ordinals
    raise(ArgumentError, "#{character_ordinals.uniq.to_sentence} duplicated in #{character_ordinals}") unless uniq?(character_ordinals)
    raise(ArgumentError, "#{character_ordinals} is not in ascending order") unless sorted?(character_ordinals)
    raise(ArgumentError, "#{character_ordinals} would reveal entire password") unless character_ordinals.size < password.size
    raise(ArgumentError, "#{ordinals_out_of_bounds(password, character_ordinals).to_sentence} out of bounds") unless character_ordinals.all? { |i| i.in?(1..password.length) }

    @password = password
    @indices = indices character_ordinals
  end

  def characters
    @indices.map { |index| @password[index] }
  end

  private

  def uniq? a
    a.uniq == a
  end

  def sorted? a
    a.sort == a
  end

  def ordinals_out_of_bounds password, ordinals
    ordinals.reject { |i| i.in?(1..password.length) }
  end

  def indices character_ordinals
    character_ordinals.map { |n| n.to_i - 1 }
  end
end