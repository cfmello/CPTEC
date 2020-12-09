class Servant < ApplicationRecord
  belongs_to :user
  has_many :investigations
end
