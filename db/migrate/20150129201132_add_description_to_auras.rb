class AddDescriptionToAuras < ActiveRecord::Migration
  def change
    add_column :auras, :description, :text
  end
end
