class AddTitleToFileVersionMemberships < ActiveRecord::Migration[5.2]
  def change
    add_column :file_version_memberships, :title, :string
  end
end
