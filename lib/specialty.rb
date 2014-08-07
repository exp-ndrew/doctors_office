class Specialty

  attr_reader :name, :id

  def initialize attributes
    @name = attributes[:name]
  end

  def save
    specialty_save = DB.exec("INSERT INTO specialties (name) VALUES ('#{@name}') RETURNING id;")
    @id = specialty_save.first['id'].to_i
  end

  def self.show_doctors input_specialty_id
   show_doctors_result = DB.exec("SELECT doctors.name
                                    FROM doctors JOIN specialties
                                    ON (doctors.specialty_id = specialties.id)
                                    WHERE (specialties.id = #{input_specialty_id});")
    doctors = []
    show_doctors_result.each do |doctor|
      name = doctor['name']
      specialty_id = doctor['specialty_id']
      insurance_id = doctor['insurance_id']
      doctors << Doctor.new({:name => name, :insurance_id => insurance_id, :specialty_id => specialty_id})
    end
    doctors
  end

end
