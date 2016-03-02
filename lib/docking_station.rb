class DockingStation
	attr_reader :bikes, :capacity

	DEFAULT_CAPACITY = 20

	def initialize(*capacity)
		@bikes = []
		@capacity = capacity.first
		@capacity ||= DEFAULT_CAPACITY
	end

  def release_bike
  	raise "No Bikes!" if empty?
  	@bikes.pop
  end

  def dock_bike(bike)
		raise "Too Many Bikes!" if full?
  	@bikes << bike
  end

  private

  def full?
	@bikes.length == @capacity
  end

  def empty?
  	@bikes.empty?
  end
end
