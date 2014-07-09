class User < ActiveRecord::Base
  has_many :moods
  has_many :actions
  has_secure_password
end
