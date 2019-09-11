class AddCreatorToAliases < ActiveRecord::Migration[5.2]
  def change
    add_reference :aliases, :creator, foreign_key: true
  end
end
