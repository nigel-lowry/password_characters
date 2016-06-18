require 'password_and_ordinals'

RSpec.describe PasswordAndOrdinals do
  describe '#characters' do
    subject { PasswordAndOrdinals.new('secret', [1, 2]).characters }

    it { should eq(%w(s e)) }
  end

  it 'raises error when not in ascending order' do
    expect {
      PasswordAndOrdinals.new('secret', [2, 1])
    }.to raise_error(ArgumentError).with_message('[2, 1] is not in ascending order')
  end

  describe 'duplicates' do
    context 'one ordinal duplicated' do
      it 'raises error' do
        expect {
          PasswordAndOrdinals.new('secret', [1, 1])
        }.to raise_error(ArgumentError).with_message('1 duplicated in [1, 1]')
      end
    end

    context 'two ordinals duplicated' do
      it 'raises error' do
        expect {
          PasswordAndOrdinals.new('secret', [1, 1, 2, 2])
        }.to raise_error(ArgumentError).with_message('1 and 2 duplicated in [1, 1, 2, 2]')
      end
    end

    context 'three ordinals duplicated' do
      it 'raises error' do
        expect {
          PasswordAndOrdinals.new('secret', [1, 1, 2, 2, 3, 3])
        }.to raise_error(ArgumentError).with_message('1, 2, and 3 duplicated in [1, 1, 2, 2, 3, 3]')
      end
    end
  end
end