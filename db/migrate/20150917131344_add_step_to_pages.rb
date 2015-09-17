class AddStepToPages < ActiveRecord::Migration
  def change
    add_column :pages, :step, :string
  end
end
