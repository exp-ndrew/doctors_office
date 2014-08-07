require 'spec_helper'
require 'doctor'


describe "Doctor" do
  it 'is initialized with a name and specialty' do
    test_doctor = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1})
    expect(test_doctor).to be_an_instance_of Doctor
  end

  describe "save" do
    it "saves Doctor.new data to the database" do
      test_doctor = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      test_doctor.save
      expect(Doctor.all).to eq [test_doctor]
    end
  end

  describe ".all" do
    it "returns all doctors when Doctor.all is called" do
      test_doctor1 = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      test_doctor2 = Doctor.new({:name => 'Dr. Johnson', :insurance_id => 1, :specialty_id => 1})
      test_doctor1.save
      test_doctor2.save
      expect(Doctor.all).to eq [test_doctor1, test_doctor2]
    end
  end

  describe "==" do
    it "two doctors with the same name are the same doctor" do
      test_doctor1 = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      test_doctor2 = Doctor.new({:name => 'Dr. Smith', :insurance_id => 1, :specialty_id => 1})
      expect(test_doctor1).to eq test_doctor2
    end
  end
end
