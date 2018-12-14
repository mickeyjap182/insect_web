class User < ApplicationRecord
  # include ActiveModel::Serializatio
  # attr_accessor :nickname, :kind, :email, :password, :birthday, :status
  STATUS_INVALID = 0
  STATUS_VALID = 10

  CLS_GUEST = 10
  CLS_ADMIN = 20

  has_many :temp_humidity, :through => :sensor

  validates(:nickname, presence: true)
  # validates_format_of(:email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i)
  validates(:birthday, presence: true)
  validates(:password, presence: true)
  # validates(:kind, presence: true)
  validates(:status, presence: true)


end
