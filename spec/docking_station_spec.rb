require 'docking_station'

describe DockingStation do
   let(:bike_instance) { double :bike }
   let(:parked_bike) { subject.park_bike(double(:bike)) }

  describe "initialize" do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.park_bike(bike_instance)
      end
    expect{ subject.park_bike(bike_instance)}.to raise_error 'NO MORE BIKES PLEASE'
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

  describe "#bike" do
    it "can view a bike that has been parked in a docking station" do
      parked_bike
      expect(subject.bikes).to include(parked_bike)
    end
  end


  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike)  }

    it "raises an error when there are no bikes in the docking station" do
       expect { subject.release_bike }.to raise_error "NO BIKES"
    end

    it 'expects released bike to be working' do
        subject.park_bike(bike_instance)
          allow(bike_instance).to receive(:working).and_return(true)
        expect(subject.release_bike.working).to eq true
    end

    it 'raises an error when trying to release broken bike' do
        subject.park_bike(bike_instance)
          allow(bike_instance).to receive(:working).and_return(false)
        expect { subject.release_bike }.to raise_error "BIKE IS BROKEN"
    end
  end

  describe '#park_bike' do

    it { is_expected.to respond_to(:park_bike).with(1).argument }
    it { is_expected.to respond_to(:park_bike).with(2).argument }

    it 'returns bike that it has received' do
      expect(subject.park_bike(bike_instance)).to eq bike_instance
    end

    it 'raises an error "NO MORE BIKES PLEASE" when there already are 20 bikes parked' do
      DockingStation::DEFAULT_CAPACITY.times {subject.park_bike Bike.new}
      expect { parked_bike }.to raise_error "NO MORE BIKES PLEASE"
    end

  end

end
