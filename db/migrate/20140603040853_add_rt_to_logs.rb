class AddRtToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :response_time, :integer
  end
end
