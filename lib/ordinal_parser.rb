class OrdinalParser
  def initialize(string, password=nil)
    @input = string
    @password = password
  end

  def ordinal
    if @input.include? 'first'
      1
    elsif @input.include? 'last'
      raise(ArgumentError, "Need password to deal with '#{@input}'") if @password.nil?
      @password.size
    else
      @input[/\d+/].to_i
    end
  end
end