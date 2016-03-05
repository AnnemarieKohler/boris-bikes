require "bike"

describe Bike do

  describe '#working' do
    it { is_expected.to respond_to :working }

    it 'returns true for working bikes' do
       expect(subject.working).to eq true
     end

    it 'returns false for broken bike' do
       subject.broken
       expect(subject.working).to eq false
     end
  end


end
