class CreateAuraTransitions < ActiveRecord::Migration
  def change
    create_table :aura_transitions do |t|
      t.string :to_state, null: false
      t.text :metadata, default: "{}"
      t.integer :sort_key, null: false
      t.integer :aura_id, null: false
      t.timestamps
    end

    add_index :aura_transitions, :aura_id
    add_index :aura_transitions, [:sort_key, :aura_id], unique: true
  end
end
