class AddLocaleToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :locale, :string, default: 'en'
  end
end
