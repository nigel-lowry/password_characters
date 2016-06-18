require 'password_and_ordinals'

RSpec.describe PasswordAndOrdinals do
  describe '#characters' do
    subject { PasswordAndOrdinals.new('secret', [1, 2, 3]).characters }

    it { should eq(%w(s e c)) }
  end

  it 'raises error when not in ascending order' do
    expect {
      PasswordAndOrdinals.new('secret', [3, 2, 1])
    }.to raise_error '[3, 2, 1] is not in ascending order'
  end
end