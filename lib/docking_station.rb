class DockingStation

  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "NO BIKES" if empty?
    raise "BIKE IS BROKEN" if bikes.last.working == false
    bikes.pop
  end

  def park_bike(bike, working=true)
    raise "NO MORE BIKES PLEASE" if full?
    bike.working if working == false
    bikes << bike
    bikes.last
  end

  private

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end
