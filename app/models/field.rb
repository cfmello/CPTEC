class Field < ApplicationRecord
  belongs_to :expert
  validates :area, presence: true
  validates :title, uniqueness: { case_sensitive: false, scope: :title }
end
