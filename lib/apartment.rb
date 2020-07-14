class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms

  def initialize(details, renter = nil)
    @number = details[:number]
    @monthly_rent = details[:monthly_rent]
    @bathrooms = details[:bathrooms]
    @bedrooms = details[:bedrooms]
    @renter = renter
  end

  def renter
    @renter
  end
  #
  def add_renter(renter)
    # require 'pry'; binding.pry
    @renter = Renter.new(renter)

  end

end
