require 'docking_station'
require 'bike'

describe DockingStation do

    it { is_expected.to respond_to(:bikes)}

    it 'expects bikes to be working' do
  		if subject.bikes.empty?
  		      bike = Bike.new
  		      subject.dock_bike(bike)
  	 	end
	  	bike = subject.release_bike
	  	expect(bike).to be_working
    end

    describe '#release_bike' do
      it { is_expected.to respond_to(:release_bike)}

      it 'expects docked bike to be returned bike' do
        bike = Bike.new
        subject.dock_bike(bike)
        expect(subject.bikes.last).to eq bike
      end

      it "raises an error if user tries to release bike when there isn't one" do
        subject.release_bike if !subject.bikes.empty?
        expect { subject.release_bike }.to raise_error("No Bikes!")
      end
    end

    describe '#dock_bike' do
      it { is_expected.to respond_to(:dock_bike).with(1).argument}

      it "raises an error if user tries to park bike when there is one" do
        if subject.bikes.empty?
          bike = Bike.new
          subject.dock_bike(bike)
        end
        expect { subject.dock_bike(bike)}.to raise_error("Too Many Bikes!")
      end
    end
end
