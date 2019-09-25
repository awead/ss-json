class CreateWorkVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :work_versions do |t|
      t.references :work, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
