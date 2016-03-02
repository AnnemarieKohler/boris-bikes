require 'docking_station'
require 'bike'

describe DockingStation do
    it { is_expected.to respond_to(:release_bike)}

    it 'expects bikes to be working' do
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock_bike).with(1).argument}
    it { is_expected.to respond_to(:bike)}

end
