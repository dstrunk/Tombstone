class AddAssociationsToAuras < ActiveRecord::Migration
  def change
    add_reference :auras, :status, index: true
    add_reference :auras, :job_number, index: true

    remove_column :auras, :job_number
    remove_column :auras, :status
  end
end
