class ExpertChangeColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :experts, :active, :boolean, null: false, default: true, from: nil, to: true
  end
end
