class AddProfileLinksToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :twitter_url, :string
    add_column :makers, :website, :string
  end
end
