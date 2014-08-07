class Patient

  attr_reader :name, :dob, :insurance_id, :id

  def initialize(attributes)
    @name = attributes[:name]
    @dob = attributes[:dob]
    @insurance_id = attributes[:insurance_id]
  end

  def save
    save = DB.exec("INSERT INTO patients (name,dob,insurance_id) VALUES ('#{name}', '#{dob}', #{insurance_id}) RETURNING id;")
    @id = save.first['id'].to_i
  end

  def assign_to(doctor_id)
    DB.exec("INSERT INTO dp_join (doctor_id, patient_id) VALUES (#{doctor_id}, #{@id}) RETURNING id;")
  end

  def doctors
    doctors_result = DB.exec("SELECT doctors.name
      FROM doctors JOIN dp_join
      ON (doctors.id = dp_join.doctor_id)
      AND (dp_join.patient_id = #{@id})")
      doctors = []
    doctors_result.each do |doctor|
      name = doctor['name']
      insurance_id = doctor['insurance_id']
      specialty_id = doctor['specialty_id']
      doctors << Doctor.new({:name => name, :insurance_id => insurance_id, :specialty_id => specialty_id})
    end
    doctors
  end

  def ==(another_patient)
    self.name == another_patient.name
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


end

