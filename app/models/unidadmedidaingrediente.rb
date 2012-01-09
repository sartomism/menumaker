class Unidadmedidaingrediente < ActiveRecord::Base
  validates_uniqueness_of :ingrediente, :scope => :unidadmedida

end
