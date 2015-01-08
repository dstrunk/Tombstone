class CreateJobNumbers < ActiveRecord::Migration
  def change
    create_table :job_numbers do |t|
      t.integer :number

      t.timestamps
    end
  end
end
