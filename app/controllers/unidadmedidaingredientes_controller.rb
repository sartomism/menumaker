class UnidadmedidaingredientesController < ApplicationController
  # GET /unidadmedidaingredientes
  # GET /unidadmedidaingredientes.xml
  def index
    @unidadmedidaingredientes = Unidadmedidaingrediente.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidadmedidaingredientes }
    end
  end

  # GET /unidadmedidaingredientes/1
  # GET /unidadmedidaingredientes/1.xml
  def show
    @unidadmedidaingrediente = Unidadmedidaingrediente.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unidadmedidaingrediente }
    end
  end

  # GET /unidadmedidaingredientes/new
  # GET /unidadmedidaingredientes/new.xml
  def new
    @unidadmedidaingrediente = Unidadmedidaingrediente.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unidadmedidaingrediente }
    end
  end

  # GET /unidadmedidaingredientes/1/edit
  def edit
    @unidadmedidaingrediente = Unidadmedidaingrediente.find(params[:id])
  end

  # POST /unidadmedidaingredientes
  # POST /unidadmedidaingredientes.xml
  def create
    @unidadmedidaingrediente = Unidadmedidaingrediente.new(params[:unidadmedidaingrediente])

    respond_to do |format|
      if @unidadmedidaingrediente.save
        flash[:notice] = 'Unidadmedidaingrediente was successfully created.'
        format.html { redirect_to(@unidadmedidaingrediente) }
        format.xml  { render :xml => @unidadmedidaingrediente, :status => :created, :location => @unidadmedidaingrediente }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unidadmedidaingrediente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unidadmedidaingredientes/1
  # PUT /unidadmedidaingredientes/1.xml
  def update
    @unidadmedidaingrediente = Unidadmedidaingrediente.find(params[:id])

    respond_to do |format|
      if @unidadmedidaingrediente.update_attributes(params[:unidadmedidaingrediente])
        flash[:notice] = 'Unidadmedidaingrediente was successfully updated.'
        format.html { redirect_to(@unidadmedidaingrediente) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unidadmedidaingrediente.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unidadmedidaingredientes/1
  # DELETE /unidadmedidaingredientes/1.xml
  def destroy
    @unidadmedidaingrediente = Unidadmedidaingrediente.find(params[:id])
    @unidadmedidaingrediente.destroy

    respond_to do |format|
      format.html { redirect_to(unidadmedidaingredientes_url) }
      format.xml  { head :ok }
    end
  end
end
