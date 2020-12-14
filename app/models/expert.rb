class Expert < ApplicationRecord
  belongs_to :user
  has_many :fields
  has_many :investigations

  include PgSearch::Model
  pg_search_scope :smart_search,
                  against: [:city],
                  # associated_against: {
                  #   fields: [:title, :area]
                  # },
                  using: {
                    tsearch: { prefix: true }
                  }
end
