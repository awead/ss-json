class SwitchMetdataFromWorksToWorkVersion < ActiveRecord::Migration[5.2]
  def change
    add_column :work_versions, :metadata, :jsonb
    remove_column :works, :metadata
  end
end
