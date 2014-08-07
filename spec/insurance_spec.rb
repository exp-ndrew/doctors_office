require 'spec_helper'
require 'insurance'
require 'doctor'
require 'pry'

describe "Insurance" do
  it "initializes with a insurance name" do
    test_insurance = Insurance.new({:name => 'Acme Insurance'})
    expect(test_insurance).to be_an_instance_of Insurance
  end

  describe "save" do
    it "saves to the database" do
      test_insurance = Insurance.new({:name => 'Acme Insurance'})
      test_insurance.save
      expect(test_insurance.id).to be_an_instance_of Fixnum
    end
  end

  describe "self.show_doctors" do
    it "returns a list of doctors with a given insurance" do
      test_insurance = Insurance.new({:name => 'Acme Insurance'})
      test_insurance.save
      test_doctor = Doctor.new({:name => 'Dr. Smith', :specialty_id => 1, :insurance_id => test_insurance.id})
      test_doctor.save
      # binding.pry
      expect(Insurance.show_doctors(test_insurance.id)).to eq [test_doctor]
    end
  end

  describe "self.all" do
    it "returns a list of all specialties" do
      test_insurance1 = Insurance.new({:name => 'Acme Insurance'})
      test_insurance2 = Insurance.new({:name => 'Pediatrics'})
      test_insurance1.save
      test_insurance2.save
      expect(Insurance.all).to eq [test_insurance1, test_insurance2]
    end
  end
end
