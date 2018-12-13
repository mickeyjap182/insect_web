class TempHumidity < ApplicationRecord
  # attr_accessor :id, :sensor, :temp, :humidity, :inspected_at
  #
  belongs_to :sensor
end
