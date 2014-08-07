require 'rspec'
require 'pg'
require 'ud'

DB = PG.connect({:dbname => 'clinic_mgr_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM dp_join *;")
    DB.exec("DELETE FROM specialties *;")
    DB.exec("DELETE FROM insurance *;")
  end
end
