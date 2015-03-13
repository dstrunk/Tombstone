class AddUploadsToAuras < ActiveRecord::Migration
  def up
    add_attachment :auras, :analytics
  end

  def down
    remove_attachment :auras, :analytics
  end
end
