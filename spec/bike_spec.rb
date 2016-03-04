require "bike"

describe Bike do

  describe '#working?' do
    it { is_expected.to respond_to :working? }
  end

  describe '#broken?' do
    it { is_expected.to respond_to :broken? }
  end

  describe '#report_broken' do
    it 'can be reported broken' do
      subject.report_broken
      expect(subject).to be_broken
    end
  end
end
