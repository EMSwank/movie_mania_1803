class CreateAwardMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :award_movies do |t|
      t.references :award, foreign_key: true
      t.references :movie, foreign_key: true

      t.timestamps
    end
  end
end
