class CreateJerries < ActiveRecord::Migration
  def change
    create_table :jerries do |t|
      t.string :name
      t.text :bio

      t.timestamps
    end
  end
end
