class AddValueToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :dl_dt, :datetime
  end
end
