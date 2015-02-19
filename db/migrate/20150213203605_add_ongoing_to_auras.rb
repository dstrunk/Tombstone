class AddOngoingToAuras < ActiveRecord::Migration
  def change
    add_column :auras, :ongoing, :boolean, default: false
  end
end
