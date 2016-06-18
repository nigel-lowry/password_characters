class OrdinalParser
  def initialize(string)
    @input = string
  end

  def ordinal
    @input.to_i
  end
end