class Expert < ApplicationRecord
  belongs_to :user
  has_many :fields, dependent: :destroy
  has_many :investigations
  has_many_attached :files

  validates :accept, presence: true, inclusion: { in: (0..2).to_a }
  validates :distance, presence: true, inclusion: { in: (20..500).to_a }
  validates :curriculum, format: { with: %r{\Ahttp://lattes.cnpq.br/\d+\z} }
  validates :doc_number, presence: true, uniqueness: true,
                         format: { with: /\A(\d{11}|\d{14})\z/ }

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
                    fields: %i[title area]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
