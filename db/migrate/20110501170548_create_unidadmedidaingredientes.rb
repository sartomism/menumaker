class CreateUnidadmedidaingredientes < ActiveRecord::Migration
  def self.up
    create_table :unidadmedidaingredientes do |t|
      t.integer :ingrediente
      t.integer :unidadmedida

      t.timestamps
    end
  end

  def self.down
    drop_table :unidadmedidaingredientes
  end
end
