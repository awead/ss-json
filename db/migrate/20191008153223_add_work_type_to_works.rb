class AddWorkTypeToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :work_type, :string
  end
end
