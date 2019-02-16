class User < ApplicationRecord
  STATUS_INVALID = 0
  STATUS_VALID = 10

  has_many :temp_humidity, :through => :sensor

  validates(:nickname, presence: true)
  # validates_format_of(:email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i)
  # validates(:birthday, presence: true)
  validates(:password, presence: true, length: { minimum: 4} )
  # validates(:status, presence: true)

  has_secure_password

  def is_enable_user?()
    return (self.status != User::STATUS_INVALID) ? true : false
  end

end
