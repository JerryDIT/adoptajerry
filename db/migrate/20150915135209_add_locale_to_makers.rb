class AddLocaleToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :locale, :string
  end
end
