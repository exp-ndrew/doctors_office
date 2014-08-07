require 'spec_helper'
require 'patient'
require 'doctor'

describe "Patient" do

  it "initializes with name, date of birth, and insurance_id" do
    test_patient = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
    expect(test_patient).to be_an_instance_of Patient
  end

  describe "save" do
    it "saves Patient.new data to the database" do
      test_patient = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
      test_patient.save
      expect(Patient.all).to eq [test_patient]
    end
  end

  describe ".all" do
    it "returns all patients when Patient.all is called" do
      test_patient1 = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
      test_patient2 = Patient.new({:name => 'Matt', :dob => '2000-12-15', :insurance_id => 1})
      test_patient1.save
      test_patient2.save
      expect(Patient.all).to eq [test_patient1, test_patient2]
    end
  end

  describe "==" do
    it "two patients with the same name are the same patient" do
      test_patient1 = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
      test_patient2 = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
      expect(test_patient1).to eq test_patient2
    end
  end

  describe "assign_to" do
    it "makes a new row in the join table given a doctor_id" do
      test_patient = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
      test_patient.save
      test_doctor = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      test_doctor.save
      test_patient.assign_to(test_doctor.id)
      expect(test_patient.doctors).to eq [test_doctor]
    end

    it "returns multiple doctors if a patient has multiple doctors" do
      test_patient = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
      test_patient.save
      test_doctor1 = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      test_doctor2 = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      test_doctor1.save
      test_doctor2.save
      test_patient.assign_to(test_doctor1.id)
      test_patient.assign_to(test_doctor2.id)
      expect(test_patient.doctors).to eq [test_doctor1, test_doctor2]
    end
  end
end
