require 'ordinal_parser'

RSpec.describe OrdinalParser do
  describe '#ordinal' do
    specify { expect(OrdinalParser.new('the first character').ordinal).to eq(1) }
    specify { expect(OrdinalParser.new('the second character').ordinal).to eq(2) }
    specify { expect(OrdinalParser.new('the third character').ordinal).to eq(3) }
    specify { expect(OrdinalParser.new('the fourth character').ordinal).to eq(4) }

    specify { expect(OrdinalParser.new('the last character', 'simsalabim').ordinal).to eq(10) }
    specify { expect(OrdinalParser.new('the second to last character', 'simsalabim').ordinal).to eq(9) }
    specify { expect(OrdinalParser.new('the second from last character', 'simsalabim').ordinal).to eq(9) }
    specify { expect(OrdinalParser.new('the third from last character', 'simsalabim').ordinal).to eq(8) }
    specify { expect(OrdinalParser.new('the fourth from last character', 'simsalabim').ordinal).to eq(7) }

    specify { expect(OrdinalParser.new('6th character').ordinal).to eq(6) }
    specify { expect(OrdinalParser.new('The 4th character').ordinal).to eq(4) }
    specify { expect(OrdinalParser.new('The 12th character').ordinal).to eq(12) }
    specify { expect(OrdinalParser.new('4th letter').ordinal).to eq(4) }

    specify { expect(OrdinalParser.new('Character 5').ordinal).to eq(5) }
    specify { expect(OrdinalParser.new('Character 52').ordinal).to eq(52) }
  end
end