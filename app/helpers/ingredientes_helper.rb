module IngredientesHelper
  
  def medida_ingrediente(ingrediente,unidad)
    medida=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" AND unidadmedida = "+unidad.id.to_s)
    if medida!=nil 
	print "checked"
      return "checked"
    else 
	print "no_checked"
      return ""
    end
  end

  def etiqueta_ingrediente(ingrediente,etiquetaing)
    etiqueta=Etiquetaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.to_s+" AND etiquetaing = "+etiquetaing.to_s)
    if etiqueta!=nil 
      return "checked"
    else 
      return ""
    end
  end
  
  
end
