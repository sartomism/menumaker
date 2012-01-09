class CreatePacks < ActiveRecord::Migration
  def self.up
    create_table :packs do |t|
      t.integer :ingrediente
      t.float :cantidad

      t.timestamps
    end
  end

  def self.down
    drop_table :packs
  end
end
