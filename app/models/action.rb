class Action < ActiveRecord::Base
  belongs_to :user
  has_many :moods
end
