class Doctor

  attr_reader :name, :insurance_id, :specialty_id, :id

  def initialize attributes
    @name = attributes[:name]
    @insurance_id = attributes[:insurance_id]
    @specialty_id = attributes[:specialty_id]
  end

  def self.all
    from_db = DB.exec("SELECT * FROM doctors")
    all_doctors = []
    from_db.each do |doctor|
      name = doctor['name']
      insurance_id = doctor['insurance_id']
      specialty_id = doctor['specialty_id']
      all_doctors << Doctor.new({:name => name, :insurance_id => insurance_id, :specialty_id => specialty_id})
    end
    all_doctors
  end

  def save
    save = DB.exec("INSERT INTO doctors (name, insurance_id, specialty_id) VALUES ('#{name}', #{insurance_id}, #{specialty_id}) RETURNING id;")
    @id = save.first['id'].to_i
  end

  def ==(another_doctor)
    self.name == another_doctor.name
  end
end
