class Bike
  def report_broken
   @broken = true
  end

  def working?
    true
  end

  def broken?
    @broken
  end
end
