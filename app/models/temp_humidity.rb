class TempHumidity < ApplicationRecord
  # attr_accessor :id, :sensor, :temp, :humidity, :inspected_at
  belongs_to :sensor

  validates(:sensor, presence: true)
  validates(:temp, presence: true)
  validates(:humidity, presence: true)
end
