class AddStatusToInvestigations < ActiveRecord::Migration[6.0]
  def change
    add_column :investigations, :status, :string
  end
end
