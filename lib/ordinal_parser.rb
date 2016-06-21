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