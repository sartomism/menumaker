class AddTipoToIngrediente < ActiveRecord::Migration
  def self.up
    add_column :ingredientes, :tipo, :integer
  end

  def self.down
    remove_column :ingredientes, :tipo
  end
end
