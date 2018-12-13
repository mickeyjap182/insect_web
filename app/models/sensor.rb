class Sensor < ApplicationRecord
  attr_accessor :id, :user, :name, :cls, :explanation, :status
  belongs_to :user
  has_many :temp_humidity

end
