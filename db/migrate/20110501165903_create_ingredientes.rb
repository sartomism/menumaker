class CreateIngredientes < ActiveRecord::Migration
  def self.up
    create_table :ingredientes do |t|
      t.string :nombre
      t.integer :unidadmedia

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredientes
  end
end
