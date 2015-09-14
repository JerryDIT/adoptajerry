class AddMissionToJerries < ActiveRecord::Migration
  def change
    add_column :jerries, :mission, :text
  end
end
