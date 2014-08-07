class Patient

  attr_reader :name, :dob, :insurance_id

  def initialize(attributes)
    @name = attributes[:name]
    @dob = attributes[:dob]
    @insurance_id = attributes[:insurance_id]
  end

  def self.all
    from_db = DB.exec("SELECT * FROM patients")
    all_patients = []
    from_db.each do |patient|
      name = patient['name']
      dob = patient['dob']
      insurance_id = patient['insurance_id']
      all_patients << Patient.new({:name => name, :dob => dob, :insurance_id => insurance_id})
    end
    all_patients
  end

  def save
    # result = Patient.new({:name => @name, :dob => @dob, :insurance_id => @insurance_id})
    DB.exec("INSERT INTO patients (name,dob,insurance_id) VALUES ('#{name}', '#{dob}', #{insurance_id});")
  end

  def ==(another_patient)
    self.name == another_patient.name
  end

end
