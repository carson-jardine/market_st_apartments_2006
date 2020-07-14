class Apartment

  attr_reader :number, :monthly_rent, :bathrooms, :bedrooms

  def initialize(details)
    @number = details[:number]
    @monthly_rent = details[:monthly_rent]
    @bathrooms = details[:bathrooms]
    @bedrooms = details[:bedrooms]
  end

end
