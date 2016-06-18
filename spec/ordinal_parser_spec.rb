require 'ordinal_parser'

RSpec.describe OrdinalParser do
  describe '.ordinal' do
    context 'with ordinal characters' do
      it 'can extract the number' do
        expect(OrdinalParser.new('6th character').ordinal).to eq(6)
      end
    end

    context 'wordy ordinal' do
      it 'can extract the number' do
        expect(OrdinalParser.new('The 4th character').ordinal).to eq(4)
      end
    end

    context 'with ordinal letters' do
      it 'can extract the number' do
        expect(OrdinalParser.new('4th letter').ordinal).to eq(4)
      end
    end

    context 'with character number' do
      it 'can extract the number' do
        expect(OrdinalParser.new('Character 5').ordinal).to eq(5)
      end
    end

    context 'more than one digit' do
      it 'can extract the number' do
        expect(OrdinalParser.new('Character 52').ordinal).to eq(52)
      end
    end
  end
end