class RecetasController < ApplicationController

  protect_from_forgery :except => [:cambiar_filtro_ingredientes]
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def condicion_basica
    return "usuario = "+usuario_actual.to_s
  end
  
  def usuario_actual
    return 1
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def index
    @recetas = Receta.find(:all,:conditions => condicion_basica)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recetas }
    end
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def show
    @receta = Receta.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receta }
    end
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def new
    @receta = Receta.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receta }
    end
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def edit
    @receta = Receta.find(params[:id])
    @etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    @ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    @ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+@receta.id.to_s);
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def create
    @receta = Receta.new(params[:receta])
    @receta.usuario = usuario_actual
    respond_to do |format|
      if @receta.save
        flash[:notice] = 'Receta was successfully created.'
        format.html { redirect_to(@receta) }
        format.xml  { render :xml => @receta, :status => :created, :location => @receta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receta.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def update
    @receta = Receta.find(params[:id])
    
    respond_to do |format|
      if @receta.update_attributes(params[:receta])
        flash[:notice] = 'Receta was successfully updated.'
        format.html { redirect_to(@receta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receta.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def destroy
    @receta = Receta.find(params[:id])
    @receta.destroy
    
    respond_to do |format|
      format.html { redirect_to(recetas_url) }
      format.xml  { head :ok }
    end
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def anadir_ingredientes
    
    pp=params[:nuevos_ingredientes]
    
    ingredientes=Ingrediente.find(:all,:conditions => condicion_basica)
    
    receta=Receta.find(pp[:receta].to_i)
    
    for ingrediente in ingredientes do
      selected=eval("pp[:select_"+ingrediente.id.to_s+"]").to_i
      if selected == 1  then
        unidad=eval("pp[:unidad_"+ingrediente.id.to_s+"]").to_i
        i=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" and unidadmedida = "+unidad.to_s)
        
        puts("Located "+i.id.to_s+"Ingrediente: "+selected.to_s + " Unidad: "+unidad.to_s)
        
        nuevo_ingrediente = Ingredientesreceta.new
        nuevo_ingrediente.receta=receta.id
        nuevo_ingrediente.ingrediente=i.id
        nuevo_ingrediente.cantidad = eval("pp[:cantidad_"+ingrediente.id.to_s+"]").to_f 
        if nuevo_ingrediente.cantidad>0 then nuevo_ingrediente.save end
        puts("Saved "+i.id.to_s)
        
      end
    end
    
    receta.agrupar
    
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_modificar_ingredientes",:locals => {:receta => receta, :ingredientes_incluidos => ingredientes_incluidos, :ingredientes_excluidos => ingredientes_excluidos,:etiquetaings=>etiquetaings})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def modificar_ingredientes
    pp=params[:ingredientes]
    
    receta=Receta.find(pp[:receta].to_i)
    
    #ingredientes=Ingrediente.find(:all)
    ingredientes=Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s)
    
    
    for ingrediente in ingredientes do
      eliminar=eval("pp[:eliminar_"+ingrediente.id.to_s+"]").to_i
      if eliminar == 1  then
        ingrediente.destroy;
      else
        unidad=eval("pp[:unidad_"+ingrediente.id.to_s+"]").to_i
        unidadmedida=Unidadmedidaingrediente.find(ingrediente.ingrediente)
        u=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+unidadmedida.ingrediente.to_s+" and unidadmedida = "+unidad.to_s)
        
        puts("ingrediente original: "+unidadmedida.id.to_s)
        puts("ingrediente nuevo: "+u.id.to_s)
        
        ingrediente.ingrediente=u.id
        ingrediente.cantidad = eval("pp[:cantidad_"+ingrediente.id.to_s+"]").to_f
        ingrediente.save
        puts("Saved "+u.id.to_s)
        
      end
    end
    
    receta.agrupar
    
    
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    render(:partial => "render_ingredientes_incluidos",:locals => {:receta => receta, :ingredientes_incluidos => ingredientes_incluidos})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def guardar_platos
    
    pp=params[:plato]
    receta=Receta.find(pp[:receta].to_i)
    
    platos=Plato.find(:all)
    
    for plato in platos do
      
      estado=eval("pp[:select_"+plato.id.to_s+"]").to_i
      puts("pp[:select_"+plato.id.to_s+"] = "+estado.to_s)
      
      nombre=eval("pp[:nombre_"+plato.id.to_s+"]").to_s
      if (plato.nombre != nombre )
        plato.nombre=nombre
        plato.save
      end
      
      
      if estado == 1
        platoreceta=Platoreceta.find(:first,:conditions => "plato = "+plato.id.to_s+" and receta = "+receta.id.to_s)
        if platoreceta == nil then
          platoreceta=Platoreceta.new
          platoreceta.receta=receta.id
          platoreceta.plato=plato.id
          platoreceta.save
        end
      else
        platoreceta=Platoreceta.find(:first,:conditions => "plato = "+plato.id.to_s+" and receta = "+receta.id.to_s)
        if platoreceta != nil then
          platoreceta.destroy
        end
      end
    end
    
    platos=Plato.find(:all,:conditions => condicion_basica)
    render(:partial => "render_platos",:locals => {:receta => receta, :platos => platos})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def guardar_etiquetas
    
    pp=params[:etiqueta]
    receta=Receta.find(pp[:receta].to_i)
    
    etiquetas=Etiqueta.find(:all,:conditions => condicion_basica)
    
    for etiqueta in etiquetas do
      
      estado=eval("pp[:select_"+etiqueta.id.to_s+"]").to_i
      puts("pp[:select_"+etiqueta.id.to_s+"] = "+estado.to_s)
      
      nombre=eval("pp[:nombre_"+etiqueta.id.to_s+"]").to_s
      if (etiqueta.nombre != nombre )
        etiqueta.nombre=nombre
        etiqueta.save
      end
      
      if estado == 1
        etiquetareceta=Etiquetareceta.find(:first,:conditions => "etiqueta = "+etiqueta.id.to_s+" and receta = "+receta.id.to_s)
        if etiquetareceta == nil then
          etiquetareceta=Etiquetareceta.new
          etiquetareceta.receta=receta.id
          etiquetareceta.etiqueta=etiqueta.id
          etiquetareceta.save
        end
      else
        etiquetareceta=Etiquetareceta.find(:first,:conditions => "etiqueta = "+etiqueta.id.to_s+" and receta = "+receta.id.to_s)
        if etiquetareceta != nil then
          etiquetareceta.destroy
        end
      end
    end
    
    etiquetas = Etiqueta.find(:all,:conditions => condicion_basica)
    render(:partial => "render_etiquetas",:locals => {:receta => receta, :etiquetas => etiquetas})
    
  end
 
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def crear_etiqueta
    
    pp=params[:nueva_etiqueta]
    receta=Receta.find(pp[:receta].to_i)
    
    etiqueta=Etiqueta.new
    etiqueta.usuario = usuario_actual
    etiqueta.nombre= pp[:nombre]
    etiqueta.save
    
    etiquetas = Etiqueta.find(:all,:conditions => condicion_basica)
    render(:partial => "render_etiquetas",:locals => {:receta => receta, :etiquetas => etiquetas})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def crear_plato
    
    pp=params[:nuevo_plato]
    receta=Receta.find(pp[:receta].to_i)
    
    plato=Plato.new
    plato.usuario = usuario_actual
    plato.nombre= pp[:nombre]
    plato.save
    
    platos=Plato.find(:all,:conditions => condicion_basica)
    render(:partial => "render_platos",:locals => {:receta => receta, :platos => platos})
  end
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def borrar_etiqueta
    etiqueta=Etiqueta.find(params[:etiqueta])
    receta=Receta.find(params[:receta].to_i)
    
    etiqueta.destroy
    
    etiquetas = Etiqueta.find(:all,:conditions => condicion_basica)
    render(:partial => "render_etiquetas",:locals => {:receta => receta, :etiquetas => etiquetas})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def borrar_plato
    plato=Plato.find(params[:plato])
    receta=Receta.find(params[:receta].to_i)
    
    plato.destroy
    
    platos=Plato.find(:all,:conditions => condicion_basica)
    render(:partial => "render_platos",:locals => {:receta => receta, :platos => platos})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def mover_etiqueta
    etiqueta=Etiqueta.find(params[:etiqueta])
    receta=Receta.find(params[:receta].to_i)
    
    etiquetas = Etiqueta.find(:all,:conditions => condicion_basica)
    render(:partial => "render_fusionar_etiquetas",:locals => {:receta => receta, :etiquetas => etiquetas,:mover => etiqueta})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def mover_plato
    plato=Plato.find(params[:plato])
    receta=Receta.find(params[:receta].to_i)
    
    platos=Plato.find(:all,:conditions => condicion_basica)
    render(:partial => "render_fusionar_platos",:locals => {:receta => receta, :platos => platos,:mover => plato})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def crear_ingrediente
    pp=params[:nuevo_ingrediente]
    receta=Receta.find(pp[:receta].to_i)
    
    ingrediente=Ingrediente.new
    ingrediente.nombre=pp[:nombre]
    ingrediente.usuario = usuario_actual
    ingrediente.save
    
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_ingredientes_disponibles",:locals => {:receta => receta, :ingredientes_excluidos => ingredientes_excluidos})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def borrar_ingrediente
    ingrediente=Ingrediente.find(params[:ingrediente])
    receta=Receta.find(params[:receta].to_i)
    
    ingrediente.destroy
    
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_ingredientes_disponibles",:locals => {:receta => receta, :ingredientes_excluidos => ingredientes_excluidos})
  end
  
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def fusionar_etiqueta
    pp=params[:fusionar]
    
    receta=Receta.find(pp[:receta].to_i)
    etiqueta_origen=Etiqueta.find(pp[:etiqueta])
    etiqueta_destino=Etiqueta.find(pp[:fusionar_con])
    
    if etiqueta_origen.id != etiqueta_destino.id 
      puts("Fusionar etiquetas "+etiqueta_origen.id.to_s+" con "+etiqueta_destino.id.to_s)
      etiquetas=Etiquetareceta.find(:all,:conditions => "etiqueta = "+etiqueta_origen.id.to_s)
      puts("Existen "+etiquetas.count.to_s+" recetas con la etiqueta "+etiqueta_origen.id.to_s)
      
      for etiqueta in etiquetas do
        existe=Etiquetareceta.find(:first,:conditions => "etiqueta = "+etiqueta_destino.id.to_s+" AND receta = "+etiqueta.receta.to_s)
        if existe == nil
          etiqueta.etiqueta=etiqueta_destino.id
          etiqueta.save 
          puts(etiqueta.id.to_s+" modificada")
        else
          puts(etiqueta.id.to_s+" eliminada")
          etiqueta.destroy
        end
      end
    end
    
    etiquetas = Etiqueta.find(:all,:conditions => condicion_basica)
    render(:partial => "render_etiquetas",:locals => {:receta => receta, :etiquetas => etiquetas})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def fusionar_plato
    pp=params[:fusionar]
    
    receta=Receta.find(pp[:receta].to_i)
    plato_origen=Plato.find(pp[:plato])
    plato_destino=Plato.find(pp[:fusionar_con])
    
    if plato_origen.id != plato_destino.id 
      
      puts("Fusionar platos "+plato_origen.id.to_s+" con "+plato_destino.id.to_s)
      platos=Platoreceta.find(:all,:conditions => "plato = "+plato_origen.id.to_s)
      puts("Existen "+platos.count.to_s+" recetas del plato "+plato_origen.id.to_s)
      
      
      for plato in platos do
        existe=Platoreceta.find(:first,:conditions => "plato = "+plato_destino.id.to_s+" AND receta = "+plato.receta.to_s)
        if existe == nil
          plato.plato=plato_destino.id
          plato.save 
          puts(plato.id.to_s+" modificada")
        else
          puts(plato.id.to_s+" eliminada")
          plato.destroy
        end
      end
    end 
    
    platos = Plato.find(:all,:conditions => condicion_basica)
    render(:partial => "render_platos",:locals => {:receta => receta, :platos => platos})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def editar_ingrediente
    receta=Receta.find(params[:receta].to_i)
    ingrediente=Ingrediente.find(params[:ingrediente].to_i)
    
    unidadesmedida = Unidadmedida.find(:all)
    etiquetaings = Etiquetaing.find(:all,:conditions => condicion_basica)
    
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_editar_ingrediente",:locals => {:receta => receta, :ingredientes_incluidos => ingredientes_incluidos, :ingredientes_excluidos => ingredientes_excluidos,:editar => ingrediente,:unidadesmedida => unidadesmedida,:etiquetaings => etiquetaings })
  end
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def fusionar_ingredientes
    receta=Receta.find(params[:receta].to_i)
    mover=Ingrediente.find(params[:mover].to_i)
    
    ingredientes = Ingrediente.find(:all,:conditions => condicion_basica);
    
    render(:partial => "render_fusionar_ingredientes",:locals => {:receta => receta,:mover => mover,:ingredientes => ingredientes })
  end
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def fusionar_ingrediente
    pp=params[:fusionar]
    receta=Receta.find(pp[:receta].to_i)
    origen=Ingrediente.find(pp[:ingrediente].to_i)
    destino=Ingrediente.find(pp[:destino].to_i)
    
    puts(origen.id.to_s+" -> "+destino.id.to_s)
    unidadesmedidaingrediente=Unidadmedidaingrediente.find(:all,:conditions => 'ingrediente = '+origen.id.to_s)
    
    #Añadir unidades que no existan y
    #convertir unidades de todas las recetas
    for u_origen in unidadesmedidaingrediente
      u_destino=Unidadmedidaingrediente.find(:first,:conditions => 'ingrediente = '+destino.id.to_s+' AND unidadmedida = '+u_origen.unidadmedida.to_s)
      #si no existe la creo
      if u_destino == nil
        u_destino=Unidadmedidaingrediente.new
        u_destino.ingrediente = destino.id
        u_destino.unidadmedida = u_origen.unidadmedida
        u_destino.save
      end
      ingredientesreceta=Ingredientesreceta.find(:all,:conditions => 'ingrediente ='+u_origen.id.to_s)
      for i in ingredientesreceta
        i.ingrediente=u_destino.id
        i.save
      end
    end
    
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_modificar_ingredientes",:locals => {:receta => receta, :ingredientes_incluidos => ingredientes_incluidos, :ingredientes_excluidos => ingredientes_excluidos,:etiquetaings => etiquetaings})
  end
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def cancelar_fusionar_etiqueta
    receta=Receta.find(params[:receta].to_i)
    
    etiquetas = Etiqueta.find(:all,:conditions => condicion_basica)
    render(:partial => "render_etiquetas",:locals => {:receta => receta, :etiquetas => etiquetas})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def cancelar_fusionar_plato
    receta=Receta.find(params[:receta].to_i)
    
    platos=Plato.find(:all,:conditions => condicion_basica)
    render(:partial => "render_platos",:locals => {:receta => receta, :platos => platos})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def cancelar_editar_ingrediente
    receta=Receta.find(params[:receta].to_i)
    
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_modificar_ingredientes",:locals => {:receta => receta, :ingredientes_incluidos => ingredientes_incluidos, :ingredientes_excluidos => ingredientes_excluidos,:etiquetaings => etiquetaings})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def mostrar_receta
    receta=Receta.find(params[:receta].to_i)
    
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    render(:partial => "render_general",:locals => {:receta => receta,:ingredientes_incluidos => ingredientes_incluidos})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def mostrar_ficha
    receta=Receta.find(params[:receta].to_i)
    
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    render(:partial => "render_ficha",:locals => {:receta => receta,:ingredientes_incluidos => ingredientes_incluidos})
  end
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def update_ingrediente
    
    pp=params[:ingrediente]
    receta=Receta.find(pp[:receta].to_i)
    ingrediente=Ingrediente.find(pp[:id])
    
    unidades=Unidadmedida.find(:all,:conditions => condicion_basica)
    
    ingrediente.nombre=pp[:nombre]
    ingrediente.tipo=pp[:tipo]
    
    ingrediente.save
    
    for unidad in unidades do
      
      estado=eval("pp[:select_"+unidad.id.to_s+"]").to_i
      puts("pp[:select_"+unidad.id.to_s+"] = "+estado.to_s)
      
      if estado == 1
        unidadmedidaingrediente=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" and unidadmedida = "+unidad.id.to_s)
        if unidadmedidaingrediente == nil then
          unidadmedidaingrediente=Unidadmedidaingrediente.new
          unidadmedidaingrediente.ingrediente=ingrediente.id
          unidadmedidaingrediente.unidadmedida=unidad.id
          unidadmedidaingrediente.save
        end
      else
        unidadmedidaingrediente=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" and unidadmedida = "+unidad.id.to_s)
        if unidadmedidaingrediente != nil then
          unidadmedidaingrediente.destroy
        end
      end
    end
    
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    unidades=Unidadmedida.find(:all,:conditions => condicion_basica)

    
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    ingredientes_incluidos = Ingredientesreceta.find(:all,:conditions => "receta = "+receta.id.to_s);
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica);
    render(:partial => "render_modificar_ingredientes",:locals => {:receta => receta, :ingredientes_incluidos => ingredientes_incluidos, :ingredientes_excluidos => ingredientes_excluidos,:etiquetaings => etiquetaings})
    
  end
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def crear_unidad
    pp=params[:nueva_unidad]
    receta=Receta.find(pp[:receta].to_i)
    ingrediente=Ingrediente.find(pp[:ingrediente])
    
    unidad=Unidadmedida.new
    unidad.nombre=pp[:nombre]
    unidad.usuario = usuario_actual
    unidad.save
    
    unidades=Unidadmedida.find(:all,:conditions => condicion_basica)
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    
    render(:partial => "render_editar_ingrediente",:locals => {:receta => receta, :editar => ingrediente,:unidadesmedida => unidades ,:etiquetaings => etiquetaings})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def borrar_unidad
    
    receta=Receta.find(params[:receta].to_i)
    ingrediente=Ingrediente.find(params[:editar])
    
    unidad=Unidadmedida.find(params[:unidad])
    if unidad != nil
      unidad.destroy
    end
    
    unidades=Unidadmedida.find(:all,:conditions => condicion_basica)
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    
    render(:partial => "render_editar_ingrediente",:locals => {:receta => receta, :editar => ingrediente,:unidadesmedida => unidades ,:etiquetaings => etiquetaings})
    
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def convertir_unidad
    pp=params[:convertir_unidad]
    receta=Receta.find(pp[:receta].to_i)
    ingrediente2=Ingrediente.find(pp[:ingrediente])
    unidad_origen=Unidadmedida.find(pp[:unidad_origen].to_i)
    cantidad_origen=pp[:cantidad_origen].to_f
    unidad_destino=Unidadmedida.find(pp[:unidad_destino].to_i)
    cantidad_destino=pp[:cantidad_destino].to_f
    todos=pp[:todos].to_i
    condicion = ""

    if todos > 0 
      condicion = " AND id = "+todos.to_s
    end
    
    ingredientes = Ingrediente.find(:all,:conditions => condicion_basica + condicion)
    
    #Obtengo todos los ingredientes con las unidades origen especificadas
    
    
    for ingrediente in ingredientes
      unidadmedidadingrediente_origen=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" AND unidadmedida = "+unidad_origen.id.to_s)
      unidadmedidadingrediente_destino=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" AND unidadmedida = "+unidad_destino.id.to_s)
      puts(ingrediente.nombre)
    
      if (unidadmedidadingrediente_origen.id rescue 0) != 0
        if (unidadmedidadingrediente_destino.id rescue 0) == 0
          puts("Es NIL!")
          unidadmedidaingrediente_destino=Unidadmedidaingrediente.new
          unidadmedidaingrediente_destino.ingrediente=ingrediente.id
          unidadmedidaingrediente_destino.unidadmedida=unidad_destino.id
          unidadmedidaingrediente_destino.save
          unidadmedidadingrediente_destino=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+ingrediente.id.to_s+" AND unidadmedida = "+unidad_destino.id.to_s)
        end

        ingredientesreceta=Ingredientesreceta.find(:all,:conditions => "ingrediente = " + unidadmedidadingrediente_origen.id.to_s)
        
        for ing in ingredientesreceta
          ing.ingrediente=unidadmedidadingrediente_destino.id
          ing.cantidad=ing.cantidad * cantidad_destino / cantidad_origen
          ing.save
        end
        unidadmedidadingrediente_origen.destroy;        
      end 
    end
    
    #Obtengo multiplico sus cantidades y modifico sus unidades
    
    #Activo la unidad para el ingrediente si no estaba activada
    
    unidades=Unidadmedida.find(:all,:conditions => condicion_basica)
    etiquetaings=Etiquetaing.find(:all,:conditions => condicion_basica)
    
    render(:partial => "render_editar_ingrediente",:locals => {:receta => receta, :editar => ingrediente2,:unidadesmedida => unidades ,:etiquetaings => etiquetaings})
    
  end
  
  
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def cambiar_filtro_ingredientes
    receta=Receta.find(params[:receta].to_i)
    filtro_nombre=params[:filtro_nombre]
    filtro_tipo=params[:filtro_tipo].to_i
    condicion_especial = " AND nombre like '%"+filtro_nombre.to_s+"%'"
    if filtro_tipo > 0 
      condicion_especial+=" AND tipo = '"+filtro_tipo.to_s+"'"      
    end
    ingredientes_excluidos = Ingrediente.find(:all,:conditions => condicion_basica + condicion_especial);
    render(:partial => "render_ingredientes_disponibles",:locals => {:receta => receta, :ingredientes_excluidos => ingredientes_excluidos})
  end
  
  #################################################################################################
  # Descripcion
  #################################################################################################
  # Parametros
  #################################################################################################
  def test
    
  end
  
  
end
