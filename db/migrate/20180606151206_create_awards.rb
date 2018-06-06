class CreateAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :awards do |t|
      t.string :name
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
