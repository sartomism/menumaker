class AddUsuarioToUnidadmedida < ActiveRecord::Migration
  def self.up
    add_column :unidadmedidas, :usuario, :integer
  end

  def self.down
    remove_column :unidadmedidas, :usuario
  end
end
