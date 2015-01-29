class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name

      t.timestamps
    end

    add_column :auras, :customer_id, :integer, index: true
  end
end
