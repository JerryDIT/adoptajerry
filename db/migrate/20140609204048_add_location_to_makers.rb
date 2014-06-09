class AddLocationToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :city, :string
    add_column :makers, :bio, :text
  end
end
