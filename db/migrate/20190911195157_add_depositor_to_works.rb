class AddDepositorToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :depositor_id, :integer
    add_index :works, :depositor_id
    add_foreign_key :works, :users, column: :depositor_id
  end
end
