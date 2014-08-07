require 'spec_helper'
require 'patient'

describe "Patient" do
  it "initializes with name, date of birth, and insurance_id" do
    test_patient = Patient.new({:name => 'Andrew', :dob => '2000-12-15', :insurance_id => 1})
    expect(test_patient).to be_an_instance_of Patient
  end
end
