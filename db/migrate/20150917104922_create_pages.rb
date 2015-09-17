class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :content

      t.timestamps null: false
    end
  end
end
