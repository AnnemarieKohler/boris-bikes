class DockingStation

  attr_reader :capacity, :bikes

  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    raise "NO BIKES" if empty?
    bikes.pop
  end

  def park_bike(bike)
    raise "NO MORE BIKES PLEASE" if full?
    bikes << bike
    bikes.last
  end

  private

  #attr_accessor :bikes

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.empty?
  end

end
