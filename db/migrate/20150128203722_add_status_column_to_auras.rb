class AddStatusColumnToAuras < ActiveRecord::Migration
  def change
    add_column :auras, :status, :integer, default: 0
    drop_table :statuses
  end
end
