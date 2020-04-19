class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.datetime :released
      t.integer :points
      t.boolean :liked

      t.timestamps
    end
  end
end
