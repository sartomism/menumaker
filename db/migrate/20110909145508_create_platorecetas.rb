class CreatePlatorecetas < ActiveRecord::Migration
  def self.up
    create_table :platorecetas do |t|
      t.integer :receta
      t.integer :plato

      t.timestamps
    end
  end

  def self.down
    drop_table :platorecetas
  end
end
