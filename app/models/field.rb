class Field < ApplicationRecord
  belongs_to :expert
  before_validation :capitalize
  # validates :area, presence: true, uniqueness: { scope: %i[title expert] }

  include PgSearch::Model
  pg_search_scope :pratictioner_search,
                  against: %i[title area],
                  using: {
                    tsearch: { prefix: true }
                  }

  private

  def capitalize
    area.capitalize!
    title.capitalize! unless title.nil?
  end
end
