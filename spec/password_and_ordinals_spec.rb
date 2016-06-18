require 'password_and_ordinals'

RSpec.describe PasswordAndOrdinals do
  describe '#characters' do
    subject { PasswordAndOrdinals.new('secret', [1, 2, 3]).characters }

    it { should eq(%w(s e c)) }
  end

end