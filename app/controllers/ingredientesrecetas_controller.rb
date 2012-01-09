class IngredientesrecetasController < ApplicationController
  # GET /ingredientesrecetas
  # GET /ingredientesrecetas.xml
  def index
    @ingredientesrecetas = Ingredientesrectea.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ingredientesrecetas }
    end
  end

  # GET /ingredientesrecetas/1
  # GET /ingredientesrecetas/1.xml
  def show
    @ingredientesrectea = Ingredientesrectea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ingredientesrectea }
    end
  end

  # GET /ingredientesrecetas/new
  # GET /ingredientesrecetas/new.xml
  def new
    @ingredientesrectea = Ingredientesrectea.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ingredientesrectea }
    end
  end

  # GET /ingredientesrecetas/1/edit
  def edit
    @ingredientesrectea = Ingredientesrectea.find(params[:id])
  end

  # POST /ingredientesrecetas
  # POST /ingredientesrecetas.xml
  def create
    @ingredientesrectea = Ingredientesrectea.new(params[:ingredientesrectea])

    respond_to do |format|
      if @ingredientesrectea.save
        flash[:notice] = 'Ingredientesrectea was successfully created.'
        format.html { redirect_to(@ingredientesrectea) }
        format.xml  { render :xml => @ingredientesrectea, :status => :created, :location => @ingredientesrectea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ingredientesrectea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ingredientesrecetas/1
  # PUT /ingredientesrecetas/1.xml
  def update
    @ingredientesrectea = Ingredientesrectea.find(params[:id])

    respond_to do |format|
      if @ingredientesrectea.update_attributes(params[:ingredientesrectea])
        flash[:notice] = 'Ingredientesrectea was successfully updated.'
        format.html { redirect_to(@ingredientesrectea) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ingredientesrectea.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredientesrecetas/1
  # DELETE /ingredientesrecetas/1.xml
  def destroy
    @ingredientesrectea = Ingredientesrectea.find(params[:id])
    @ingredientesrectea.destroy

    respond_to do |format|
      format.html { redirect_to(ingredientesrecetas_url) }
      format.xml  { head :ok }
    end
  end
end
