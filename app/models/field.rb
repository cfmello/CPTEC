class Field < ApplicationRecord
  belongs_to :expert
  before_validation :capitalize
  validates :area, presence: true, uniqueness: { scope: [:title, :expert] }

  include PgSearch::Model
  pg_search_scope :pratictioner_search,
                  against: [:title, :area],
                  using: {
                    tsearch: { prefix: true }
                  }

  private

  def capitalize
    area.capitalize!
    title.capitalize!
  end
end
