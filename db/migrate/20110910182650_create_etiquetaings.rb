class CreateEtiquetaings < ActiveRecord::Migration
  def self.up
    create_table :etiquetaings do |t|
      t.integer :usuario
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :etiquetaings
  end
end
