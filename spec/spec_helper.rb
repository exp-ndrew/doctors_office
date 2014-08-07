require 'rspec'
require 'pg'

DB = PG.connect({:dbname => 'clinic_mgr_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM doctors *;")
  end
end
