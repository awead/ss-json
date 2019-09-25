class AddAasmStateToWorkVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :work_versions, :aasm_state, :string
  end
end
