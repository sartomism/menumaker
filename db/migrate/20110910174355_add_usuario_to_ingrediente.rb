class AddUsuarioToIngrediente < ActiveRecord::Migration
  def self.up
    add_column :ingredientes, :usuario, :integer
  end

  def self.down
    remove_column :ingredientes, :usuario
  end
end
