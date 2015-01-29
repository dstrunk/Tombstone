class RemoveStatusIdFromAuras < ActiveRecord::Migration
  def change
    remove_column :auras, :status_id
  end
end
