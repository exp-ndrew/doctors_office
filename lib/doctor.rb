class Doctor

  attr_reader :name, :insurance_id, :specialty_id

  def initialize attributes
    @name = attributes[:name]
    @insurance_id = attributes[:insurance_id]
    @specialty_id = attributes[:specialty_id]
  end

end
