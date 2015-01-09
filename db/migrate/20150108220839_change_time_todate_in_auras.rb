class ChangeTimeTodateInAuras < ActiveRecord::Migration
  def change
    remove_column :auras, :start_date
    remove_column :auras, :end_date

    add_column :auras, :start_date, :datetime
    add_column :auras, :end_date, :datetime
  end
end
