require './lib/docking_station.rb'
require './lib/bike.rb'

# allow user to set @capacity when DockingStation.new is called
capacity = 37
docking_station = DockingStation.new(capacity)
puts docking_station.capacity

#puts docking_station.bikes.count


# try and add 20 bikes
20.times {docking_station.dock_bike(Bike.new)}

# try and remove bike from docking station when there isn't one - should raise error
# cycle = docking_station.release_bike

# new docking station has no bikes, so park one
cycle = Bike.new
docking_station.dock_bike(cycle)
puts docking_station.bike

# remove bike from docking station
cycle = docking_station.release_bike
puts docking_station.bike
