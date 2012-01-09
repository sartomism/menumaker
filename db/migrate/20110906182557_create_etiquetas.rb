class CreateEtiquetas < ActiveRecord::Migration
  def self.up
    create_table :etiquetas do |t|
      t.integer :usuario
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :etiquetas
  end
end
