require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'
require 'pry'

class BuildingTest < Minitest::Test
  def setup
    @building = Building.new
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_building_units
    assert_equal [], @building.units
  end

  def test_building_can_add_units
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building.add_unit(unit1)
    @building.add_unit(unit2)

    assert_equal [unit1, unit2], @building.units
  end

  def test_building_can_add_renters
    skip
    assert_equal [], @building.renters

    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building.add_unit(unit1)
    @building.add_unit(unit2)

    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)

    assert_equal ["Aurora"], @building.renters

    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)

    assert_equal ["Aurora", "Tim"], @building.renters
  end

  # pry(main)> renter2 = Renter.new("Tim")
  # # => #<Renter:0x00007fa83b9b0358...>
  #
  # pry(main)> unit2.add_renter(renter2)
  #
  # pry(main)> building.renters
  # # => ["Aurora", "Tim"]

  def test_average_rent
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @building.add_unit(unit1)
    @building.add_unit(unit2)
    renter1 = Renter.new("Aurora")
    unit1.add_renter(renter1)
    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)

    assert_equal 1099.5, @building.average_rent
  end

  # pry(main)> building.average_rent
  # # => 1099.5

end
