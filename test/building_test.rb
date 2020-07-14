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

    assert_equal [renter1], @building.renters

    renter2 = Renter.new("Tim")
    unit2.add_renter(renter2)

    assert_equal [renter1, renter2], @building.renters

    ##I know it should be "Aurora" and "Tim"
  end

  # pry(main)> renter2 = Renter.new("Tim")
  # # => #<Renter:0x00007fa83b9b0358...>
  #
  # pry(main)> unit2.add_renter(renter2)
  #
  # pry(main)> building.renters
  # # => ["Aurora", "Tim"]

  def test_average_rent
    # skip
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



  def test_rented_units
    skip
    unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 1, bedrooms: 2})
    unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 2, bedrooms: 3})
    renter1 = Renter.new("Spencer")
    @building.add_unit(unit1)
    @building.add_unit(unit2)
    @building.add_unit(unit3)
    @building.add_unit(unit4)

    assert_equal [], @building.rented_units

    unit2.add_renter(renter1)
    assert_equal [renter1], @building.rented_units
  end



#
# pry(main)> unit2.add_renter(renter1)
#
# pry(main)> building.rented_units
# # => [#<Apartment:0x00007fa83bc777d0...>]
#
# pry(main)> building.renter_with_highest_rent
# # => #<Renter:0x00007fa83bc37978...>
#
# pry(main)> renter2 = Renter.new("Jessie")
# # => #<Renter:0x00007fa83b9b0358...>
#
# pry(main)> unit1.add_renter(renter2)
#
# pry(main)> building.renter_with_highest_rent
# # => #<Renter:0x00007fa83b9b0358...>
#
# pry(main)> renter3 = Renter.new("Max")
# # => #<Renter:0x00007fa83b7t0456...>
#
# pry(main)> unit3.add_renter(renter3)
#
# pry(main)> building.renter_with_highest_rent
# # => #<Renter:0x00007fa83b9b0358...>
#
# pry(main)> building.add_unit(unit4)
#
# pry(main)> building.units_by_number_of_bedrooms
# # =>
# # {
# #   3 => ["D4" ],
# #   2 => ["B2", "C3"],
# #   1 => ["A1"]
# # }

end
