class Expert < ApplicationRecord
  belongs_to :user
  has_many :fields
  has_many :investigations
  has_many_attached :files
end
