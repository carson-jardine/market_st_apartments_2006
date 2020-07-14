class Building

  attr_reader :units, :renters

  def initialize
    @units = []
    @renters = renters
  end

  def add_unit(unit)
    @units << unit
  end

  def renters
    @renters = []
    @units.each do |unit|
      unit.renter == renter
        @renters << renter
    end
    @renters
  end

end
