class CreateUnidadmedidas < ActiveRecord::Migration
  def self.up
    create_table :unidadmedidas do |t|
      t.string :nombre

      t.timestamps
    end
  end

  def self.down
    drop_table :unidadmedidas
  end
end
