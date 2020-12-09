class CreateExperts < ActiveRecord::Migration[6.0]
  def change
    create_table :experts do |t|
      t.string :doc_number
      t.string :phone_number
      t.string :city
      t.integer :distance
      t.string :curriculum
      t.boolean :active
      t.integer :accept
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
