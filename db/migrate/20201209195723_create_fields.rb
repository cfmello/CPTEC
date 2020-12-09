class CreateFields < ActiveRecord::Migration[6.0]
  def change
    create_table :fields do |t|
      t.string :title
      t.string :area
      t.string :reg_number
      t.references :expert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
