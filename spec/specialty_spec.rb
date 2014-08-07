require 'spec_helper'
require 'specialty'
require 'doctor'
require 'pry'

describe "Specialty" do
  it "initializes with a specialty name" do
    test_specialty = Specialty.new({:name => "Cardiology"})
    expect(test_specialty).to be_an_instance_of Specialty
  end

  describe ".save" do
    it "saves to the database" do
      test_specialty = Specialty.new({:name => "Cardiology"})
      test_specialty.save
      expect(test_specialty.id).to be_an_instance_of Fixnum
    end
  end

  describe "show_doctors" do
    it "returns a list of doctors with a given specialty" do
      test_specialty = Specialty.new({:name => "Cardiology"})
      test_specialty.save
      test_doctor = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => test_specialty.id})
      test_doctor.save
      # binding.pry
      expect(Specialty.show_doctors(test_specialty.id)).to eq [test_doctor]
    end
  end
end
