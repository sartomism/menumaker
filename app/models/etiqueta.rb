class Etiqueta < ActiveRecord::Base
  
  validates_uniqueness_of :nombre, :scope => :usuario
  #validates :zipcode, :uniqueness => {:scope => :recorded_at}
  
end
