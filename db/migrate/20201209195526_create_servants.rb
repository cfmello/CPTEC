class CreateServants < ActiveRecord::Migration[6.0]
  def change
    create_table :servants do |t|
      t.string :court
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
