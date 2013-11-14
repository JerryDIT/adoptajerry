class CreateOrgans < ActiveRecord::Migration
  def change
    create_table :organs do |t|
      t.string :role
      t.integer :quantifier
      t.string :unit
      t.integer :quantity
      t.string :technology
      t.references :jerry, index: true

      t.timestamps
    end
  end
end
