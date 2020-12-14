class Expert < ApplicationRecord
  belongs_to :user
  has_many :fields
  has_many :investigations

  

  include PgSearch::Model
  pg_search_scope :city_search,
                  against: [:city],
                  # associated_against: {
                  #   fields: [:title, :area]
                  # },
                  using: {
                    tsearch: { prefix: true }
                  }
  pg_search_scope :pratictioner_search,
                  associated_against: {
                    fields: [:title, :area]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
