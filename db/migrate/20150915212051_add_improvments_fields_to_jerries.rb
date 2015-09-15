class AddImprovmentsFieldsToJerries < ActiveRecord::Migration
  def change
    add_column :jerries, :organs_improvment, :text
    add_column :jerries, :skills_improvment, :text
  end
end
