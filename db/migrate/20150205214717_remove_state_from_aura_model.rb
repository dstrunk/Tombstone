class RemoveStateFromAuraModel < ActiveRecord::Migration
  def change
    remove_column :auras, :status
  end
end
