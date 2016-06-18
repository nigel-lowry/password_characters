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

  it 'raises error when have duplicates' do
    expect {
      PasswordAndOrdinals.new('secret', [1, 1])
    }.to raise_error(ArgumentError).with_message('Ordinal 1 is duplicated')
  end
end