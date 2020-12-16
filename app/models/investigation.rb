class Investigation < ApplicationRecord
  belongs_to :expert
  belongs_to :servant

  validates :proc_number, :call_date, presence: true
end
