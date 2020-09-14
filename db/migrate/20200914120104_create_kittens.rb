class CreateKittens < ActiveRecord::Migration[5.2]
  def change
    create_table :kittens do |t|
      t.integer :age
      t.string :name
      t.integer :cuteness
      t.integer :softness
      t.timestamps
    end
  end
end
