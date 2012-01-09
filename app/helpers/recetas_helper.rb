module RecetasHelper
  
  def cantidad_recetas_etiqueta(etiqueta)
    etiquetas=Etiquetareceta.find(:all,:conditions => "etiqueta = "+etiqueta.id.to_s)
    return etiquetas.count
  end

  def cantidad_recetas_plato(plato)
    platos=Platoreceta.find(:all,:conditions => "plato = "+plato.id.to_s)
    return platos.count
  end
  
  def medida_ingrediente(ingrediente,unidad)
    medida=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" AND unidadmedida = "+unidad.id.to_s)
    if medida!=nil 
      return true
    else 
      return false
    end
  end

  def uso_medida_ingrediente(ingrediente,unidad)
    medida=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" AND unidadmedida = "+unidad.id.to_s)
    if medida != nil
      usados=Ingredientesreceta.find(:all,:conditions => "ingrediente = "+medida.id.to_s)
      return usados.count
    else
      return 0
    end 
  end

  def uso_medida(unidad)
    medida=Unidadmedidaingrediente.find(:all,:conditions => "unidadmedida = "+unidad.id.to_s)
    if medida != nil
      return medida.count
    else
      return 0
    end 
  end


  def uso_ingrediente(ingrediente)
    medidas=Unidadmedidaingrediente.find(:all,:conditions => "ingrediente = "+ingrediente.id.to_s)
    resultado=0
    if medidas.count > 0
        for medida in medidas
          resultado+=Ingredientesreceta.find(:all,:conditions => "ingrediente = "+medida.id.to_s).count
        end
    end
    return resultado
  end


end
