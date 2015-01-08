class CreateAuras < ActiveRecord::Migration
  def change
    create_table :auras do |t|
      t.string :name
      t.integer :job_number
      t.time :start_date
      t.time :end_date
      t.string :status

      t.timestamps
    end
  end
end
