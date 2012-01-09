class CreateEtiquetarecetas < ActiveRecord::Migration
  def self.up
    create_table :etiquetarecetas do |t|
      t.integer :etiqueta
      t.integer :receta
      t.integer :usuario

      t.timestamps
    end
  end

  def self.down
    drop_table :etiquetarecetas
  end
end
