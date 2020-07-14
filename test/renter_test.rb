require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require 'pry'

class RenterTest < Minitest::Test
  def setup
    @renter1 = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Renter, @renter1
  end
#   pry(main)> renter1 = Renter.new("Jessie")
# # => #<Renter:0x00007a15c93af80...>
#
# pry(main)> renter1.name
# # => "Jessie"
#
# pry(main)> unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# # => #<Apartment:0x00007fb3ecaae7c0...>
#
# pry(main)> unit1.number
# # => "A1"
#
# pry(main)> unit1.monthly_rent
# # => 1200
#
# pry(main)> unit1.bathrooms
# # => 1
#
# pry(main)> unit1.bedrooms
# # => 1
#
# pry(main)> unit1.renter
# # => nil
#
# pry(main)> unit1.add_renter(renter1)
#
# pry(main)> unit1.renter
# # => #<Renter:0x00007fb3ee106ce8...>

end
