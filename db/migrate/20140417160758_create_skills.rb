class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :layer
      t.string :name
      t.string :url
      t.references :jerry, index: true

      t.timestamps
    end
  end
end
