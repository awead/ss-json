class RenameWorkVersionTitleToVersionName < ActiveRecord::Migration[5.2]
  def change
    rename_column :work_versions, :title, :version_name
  end
end
