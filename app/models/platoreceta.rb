class Platoreceta < ActiveRecord::Base
  validates_uniqueness_of :receta, :scope => :plato
end
