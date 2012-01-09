class Etiquetareceta < ActiveRecord::Base
  validates_uniqueness_of :etiqueta, :scope => :receta

end
