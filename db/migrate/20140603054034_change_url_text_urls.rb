class ChangeUrlTextUrls < ActiveRecord::Migration
  def change
    change_column :urls, :url, :text
  end
end
