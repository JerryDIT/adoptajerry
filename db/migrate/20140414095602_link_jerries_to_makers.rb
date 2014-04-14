class LinkJerriesToMakers < ActiveRecord::Migration
  def change
  	create_table :jerries_makers, id: false do |t|
      t.belongs_to :jerry
      t.belongs_to :maker
    end
  end
end
