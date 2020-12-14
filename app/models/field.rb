class Field < ApplicationRecord
  belongs_to :expert
  validates :area, presence: true, uniqueness: { case_sensitive: true, scope: :title }
end
