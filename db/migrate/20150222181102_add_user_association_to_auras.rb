class AddUserAssociationToAuras < ActiveRecord::Migration
  def change
    add_reference :auras, :user, index: true
  end
end
