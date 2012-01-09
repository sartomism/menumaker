class Ingrediente < ActiveRecord::Base
  
  validates_uniqueness_of :nombre, :scope => :usuario
  before_destroy :antes_de_borrar
  
  
private

  def antes_de_borrar
    Unidadmedidaingrediente.destroy_all("ingrediente = "+self.id.to_s)
  end
  
end
