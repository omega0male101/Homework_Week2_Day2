require('minitest/autorun')
require('minitest/pride')
require_relative('./bus')
require_relative('./person')
require_relative('./busstop')

class TestBus < MiniTest::Test

  def setup
    @bus22 = Bus.new(22, "ocean terminal")
    @John = Person.new("John", 27)
    @Eden = Person.new("Eden", 27)
    @Stop1 = BusStop.new("Haymarket")
  end

    def test_drive
      assert_equal("Brum Brum", @bus22.drive())
    end

    def test_pick_up
      assert_equal(@bus22.pick_up(@John), [@John])
    end

    def test_number_of_passengers
      assert_equal(@bus22.number_of_passengers, 0)
    end

    def test_pick_up
      @bus22.pick_up(@John)
      @bus22.pick_up(@John)
      @bus22.pick_up(@John)
      result = @bus22.number_of_passengers
      assert_equal(result, 3)
    end


    def test_drop_off
      @bus22.pick_up(@John)
      @bus22.pick_up(@John)
      @bus22.pick_up(@John)
      @bus22.drop_off(@Eden)
      result = @bus22.number_of_passengers
      assert_equal(result, 3)
    end

    def test_empty
      @bus22.pick_up(@John)
      @bus22.pick_up(@John)
      @bus22.empty
      result = @bus22.number_of_passengers
      assert_equal(result, 0)
    end

    def test_add_to_queue
      @Stop1.add_to_queue(@Eden)
      result = @Stop1.queue.length
      assert_equal(result, 1)
    end

    def test_pick_up_from_stop

        @Stop1.add_to_queue(@John)
        @Stop1.add_to_queue(@Eden)
        @bus22.pick_up_from_stop(@Stop1)
        result1 = @bus22.number_of_passengers
        result2 = @Stop1.queue

        assert_equal(result1, 2)
        assert_equal(result2, [])

    end



end