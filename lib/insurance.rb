class Insurance <UD

  attr_reader :name, :id

  def initialize attributes
    @name = attributes[:name]
  end

  def save
    insurance_save = DB.exec("INSERT INTO insurance (insurance_name) VALUES ('#{@name}') RETURNING id;")
    @id = insurance_save.first['id'].to_i
  end


  def ==(another_insurance)
    self.name == another_insurance.name
  end

  def self.all
    all_result = DB.exec("SELECT * FROM insurance;")
    insurance_entries = []
    all_result.each do |insurance|
      name = insurance['insurance_name']
      insurance_entries << Insurance.new({:name => name})
    end
    insurance_entries
  end


  def self.show_doctors input_insurance_id
   show_doctors_result = DB.exec("SELECT doctors.name
                                    FROM doctors JOIN insurance
                                    ON (doctors.insurance_id = insurance.id)
                                    WHERE (insurance.id = #{input_insurance_id});")
    doctors = []
    show_doctors_result.each do |doctor|
      name = doctor['name']
      specialty_id = doctor['specialty_id']
      insurance_id = doctor['insurance_id']
      doctors << Doctor.new({:name => name, :specialty_id => specialty_id, :insurance_id => insurance_id})
    end
    doctors
  end

end
