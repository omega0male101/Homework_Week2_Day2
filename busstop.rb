class BusStop

  attr_reader :name
  attr_accessor :queue

  def initialize(name)
    @name = name
    @queue = []
  end

  def add_to_queue(person)
    @queue << person
  end

  


end