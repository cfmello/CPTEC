class CreateInvestigations < ActiveRecord::Migration[6.0]
  def change
    create_table :investigations do |t|
      t.string :proc_number
      t.float :cost
      t.date :call_date
      t.references :expert, null: false, foreign_key: true
      t.references :servant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
