class Sensor < ApplicationRecord
  belongs_to :user
  has_many :temp_humidity

  validates(:user_id, presence: true)
  validates(:name, presence: true)

end
