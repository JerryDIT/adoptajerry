class AddLocationToJerries < ActiveRecord::Migration
  def change
    add_column :jerries, :location, :string
  end
end
