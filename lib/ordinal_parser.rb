class OrdinalParser
  def initialize(string)
    @input = string
  end

  def ordinal
    @input[/\d+/].to_i
  end
end