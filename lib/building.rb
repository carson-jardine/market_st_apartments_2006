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
    #doesn't work
    @units.map do |unit|
      unit.renter
    end
  end

  def average_rent
    @units.sum do |unit|
      unit.monthly_rent.to_f / @units.length
    end
  end

  def rented_units
    #doesn't work
    rented_units = []
    @units.each do |unit|
      unit.any? do |renter|
        unit.renter == renter
        if unit.include?(renter)
          rented_units << renter
        end
      end
    end
  end



end
