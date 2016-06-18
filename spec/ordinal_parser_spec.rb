require 'ordinal_parser'

RSpec.describe OrdinalParser do
  describe '.ordinal' do
    context 'with ordinal characters' do
      it 'can extract the number' do
        expect(OrdinalParser.new('6th character').ordinal).to eq(6)
      end
    end
  end
end