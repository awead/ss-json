class CreateWorkCreations < ActiveRecord::Migration[5.2]
  def change
    create_table :work_creations do |t|
      t.references :alias, foreign_key: true
      t.references :work, foreign_key: true

      t.timestamps
    end
  end
end
