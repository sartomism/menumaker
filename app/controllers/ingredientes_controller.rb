class IngredientesController < ApplicationController
  # GET /ingredientes
  # GET /ingredientes.xml
  def index
    @ingredientes = Ingrediente.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredientes }
    end
  end

  # GET /ingredientes/1
  # GET /ingredientes/1.xml
  def show
    @ingrediente = Ingrediente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingrediente }
    end
  end

  # GET /ingredientes/new
  # GET /ingredientes/new.xml
  def new
    @ingrediente = Ingrediente.new
    @unidadesmedida = Unidadmedida.find(:all)
  end

  # GET /ingredientes/1/edit
  def edit
    @ingrediente = Ingrediente.find(params[:id])
    @unidadesmedida = Unidadmedida.find(:all)
    @etiquetaings = Etiquetaing.find(:all)
  end

  # POST /ingredientes
  # POST /ingredientes.xml
  def create
    @ingrediente = Ingrediente.new(params[:ingrediente])
    if @ingrediente.save
      unidadesmedida = Unidadmedida.find(:all)
      for unidad in unidadesmedida
        valor=0
        medida=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+@ingrediente.id.to_s+" AND unidadmedida = "+unidad.id.to_s)
        if params["unidad_"+unidad.id.to_s]=="yes"
          if medida==nil
            medida=Unidadmedidaingrediente.new
            medida.ingrediente=@ingrediente.id
            medida.unidadmedida=unidad.id
            medida.save
          end
        else
          if medida!=nil 
            medida.destroy
          end
        end
      end
    end
    redirect_to :action => "index"
  end

  # PUT /ingredientes/1
  # PUT /ingredientes/1.xml
  def update
    @ingrediente = Ingrediente.find(params[:id])

    if @ingrediente.update_attributes(params[:ingrediente])
      unidadesmedida = Unidadmedida.find(:all)
      etiquetaings = Etiquetaing.find(:all)

      for unidad in unidadesmedida
        valor=0
        medida=Unidadmedidaingrediente.find(:first,:conditions => "ingrediente = "+@ingrediente.id.to_s+" AND unidadmedida = "+unidad.id.to_s)
        if params["unidad_"+unidad.id.to_s]=="yes"
          if medida==nil
            medida=Unidadmedidaingrediente.new
            medida.ingrediente=@ingrediente.id
            medida.unidadmedida=unidad.id
            medida.save
          end
        else
          if medida!=nil 
            medida.destroy
          end
        end
      end 
    end
    redirect_to :back
  end

  # DELETE /ingredientes/1
  # DELETE /ingredientes/1.xml
  def destroy
    @ingrediente = Ingrediente.find(params[:id])
    @ingrediente.destroy

    respond_to do |format|
      format.html { redirect_to(ingredientes_url) }
      format.xml  { head :ok }
    end
  end
end
