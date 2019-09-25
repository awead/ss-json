class CreateVersionMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :version_memberships do |t|
      t.references :work_version, foreign_key: true
      t.references :file_resource, foreign_key: true

      t.timestamps
    end
  end
end
