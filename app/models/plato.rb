class Plato < ActiveRecord::Base
  validates_uniqueness_of :nombre, :scope => :usuario
end
