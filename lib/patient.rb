class Patient
  def initialize(attributes)
    @name = attributes[:name]
    @dob = attributes[:dob]
    @insurance_id = attributes[:insurance_id]
  end
end
