class AddAvatarToJerries < ActiveRecord::Migration
  def change
    add_column :jerries, :avatar, :string
  end
end
