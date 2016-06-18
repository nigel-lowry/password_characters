require 'set'

class PasswordAndOrdinals
  def initialize password, character_ordinals
    abort "Indices weren't unique." unless uniq?(character_ordinals)
    abort "Indices weren't sorted." unless sorted?(character_ordinals)

    @password = password
    @indices = indices character_ordinals

    abort "Indices weren't a subset" unless subset?
    abort 'Indices were out of bounds' unless in_bounds?
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

  def subset?
    all_indices_set = Set.new 0...@password.length
    indices_set = Set.new @indices
    indices_set.proper_subset? all_indices_set
  end

  def in_bounds?
    @indices.all? { |i| i >= 0 && i < @password.length }
  end

  def indices character_ordinals
    character_ordinals.map { |n| n.to_i - 1 }
  end
end