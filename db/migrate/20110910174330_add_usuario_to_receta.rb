class AddUsuarioToReceta < ActiveRecord::Migration
  def self.up
    add_column :recetas, :usuario, :integer
  end

  def self.down
    remove_column :recetas, :usuario
  end
end
