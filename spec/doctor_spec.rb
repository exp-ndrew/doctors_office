require 'spec_helper'
require 'doctor'

describe "Doctor" do
  it 'is initialized with a name and specialty' do
    test_doctor = Doctor.new({:name => 'Dr. Smith', :insurance => "Heart"})
    expect(test_doctor).to be_an_instance_of Doctor
  end

end
