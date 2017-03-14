class Bus

  attr_reader :route, :destination

  def initialize (route, destination)
    @route = route
    @destination = destination
    @passengers = []

  end

  def drive
    return "Brum Brum"
  end

  def number_of_passengers
    @passengers.length
  end

  def pick_up(passenger)
    @passengers << passenger
  end

  def drop_off(passenger)
    @passengers.delete(passenger)
  end

  def empty
    @passengers = []
  end

  def pick_up_from_stop(stop)
    for passenger in stop.queue
      @passengers << passenger
    end
    stop.queue.clear()

  end

end