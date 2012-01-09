class CreateIngredientesrecteas < ActiveRecord::Migration
  def self.up
    create_table :ingredientesrecetas do |t|
      t.integer :receta
      t.integer :ingrediente
      t.float :cantidad

      t.timestamps
    end
  end

  def self.down
    drop_table :ingredientesrecetas
  end
end
