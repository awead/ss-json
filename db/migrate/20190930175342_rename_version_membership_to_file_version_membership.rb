class RenameVersionMembershipToFileVersionMembership < ActiveRecord::Migration[5.2]
  def change
    rename_table :version_memberships, :file_version_memberships
  end
end
