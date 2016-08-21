require 'password_characters'

RSpec.describe PasswordCharacters::PasswordAndOrdinals do
  describe '#characters' do
    subject { PasswordCharacters::PasswordAndOrdinals.new('secret', [1, 2]).characters }

    it { should eq(%w(s e)) }
  end

  describe 'construction' do
    it 'raises error when in descending order' do
      expect {
        PasswordCharacters::PasswordAndOrdinals.new('secret', [2, 1])
      }.to raise_error(ArgumentError).with_message('[2, 1] is not in ascending order')
    end

    it 'raises error when in no order' do
      expect {
        PasswordCharacters::PasswordAndOrdinals.new('secret', [2, 1, 3])
      }.to raise_error(ArgumentError).with_message('[2, 1, 3] is not in ascending order')
    end

    it 'raises error when only asking for one character' do
      expect {
        PasswordCharacters::PasswordAndOrdinals.new('secret', [1])
      }.to raise_error(ArgumentError).with_message('[1] only asks for one character')
    end

    it 'raises error when not asking for any characters' do
      expect {
        PasswordCharacters::PasswordAndOrdinals.new('secret', [])
      }.to raise_error(ArgumentError).with_message('[] does not ask for any characters')
    end

    it 'raises error when not asking for character index' do
      expect {
        PasswordCharacters::PasswordAndOrdinals.new('secret', ['a', 'b'])
      }.to raise_error(ArgumentError).with_message('["a", "b"] does not only ask for integers')
    end

    describe 'bounds' do
      context 'below' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [0, 1])
          }.to raise_error(ArgumentError).with_message('0 out of bounds')
        end
      end

      context 'above' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [6, 7])
          }.to raise_error(ArgumentError).with_message('7 out of bounds')
        end
      end

      context 'two out of bounds' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [6, 7, 8])
          }.to raise_error(ArgumentError).with_message('7 and 8 out of bounds')
        end
      end

      context 'three out of bounds' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [6, 7, 8, 9])
          }.to raise_error(ArgumentError).with_message('7, 8, and 9 out of bounds')
        end
      end
    end

    describe 'subset' do
      context 'asking for whole password' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('abc', [1, 2, 3])
          }.to raise_error(ArgumentError).with_message('[1, 2, 3] would reveal entire password')
        end
      end

      context 'asking for proper subset' do
        it 'does not raise error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('abc', [1, 2])
          }.to_not raise_error
        end
      end
    end

    describe 'duplicates' do
      context 'one ordinal duplicated' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [1, 1])
          }.to raise_error(ArgumentError).with_message('1 duplicated in [1, 1]')
        end
      end

      context 'two ordinals duplicated' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [1, 1, 2, 2])
          }.to raise_error(ArgumentError).with_message('1 and 2 duplicated in [1, 1, 2, 2]')
        end
      end

      context 'three ordinals duplicated' do
        it 'raises error' do
          expect {
            PasswordCharacters::PasswordAndOrdinals.new('secret', [1, 1, 2, 2, 3, 3])
          }.to raise_error(ArgumentError).with_message('1, 2, and 3 duplicated in [1, 1, 2, 2, 3, 3]')
        end
      end
    end
  end
end