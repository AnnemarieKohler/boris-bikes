class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    raise "NO BIKES" if @bikes.empty?
    @bikes.pop
  end

  def park_bike(bike)
    raise "NO MORE BIKES PLEASE" if @bikes.length >= 1
    @bikes << bike
    @bikes.last
  end

end
