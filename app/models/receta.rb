class Receta < ActiveRecord::Base
  validates_uniqueness_of :nombre, :scope => :usuario
  
  def agrupar
    
    ingredientes = Ingredientesreceta.find(:all,:conditions => "receta = "+self.id.to_s).map {|i| i.ingrediente }.uniq
    
    for i in ingredientes
      cuantos = Ingredientesreceta.find(:all,:conditions => "receta = "+self.id.to_s+" AND ingrediente = "+i.to_s)
      if cuantos.count > 1
        total=0
        for cuanto in cuantos do total+=cuanto.cantidad end
        for cuanto in cuantos do cuanto.cantidad=0 end
        cuantos.first.cantidad=total;
        cuantos.first.save
        for cuanto in cuantos do 
          if cuanto.cantidad == 0 then
            cuanto.destroy
          end
        end
      end
    end
    
  end
  
end
