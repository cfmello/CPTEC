class Field < ApplicationRecord
  belongs_to :expert
  before_validation :capitalize
  validates :area, presence: true, uniqueness: { case_sensitive: false, scope: [:title, :expert] }

  include PgSearch::Model
  pg_search_scope :pratictioner_search,
                  against: [ :title, :area ],
                  using: {
                    tsearch: { prefix: true }
                  }
  
  private

  def capitalize
    self.area.capitalize!
    self.title.capitalize!
  end
end
