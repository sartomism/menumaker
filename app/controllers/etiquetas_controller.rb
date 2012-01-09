class EtiquetasController < ApplicationController
  # GET /etiquetas
  # GET /etiquetas.xml
  def index
    @etiquetas = Etiqueta.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @etiquetas }
    end
  end

  # GET /etiquetas/1
  # GET /etiquetas/1.xml
  def show
    @etiqueta = Etiqueta.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @etiqueta }
    end
  end

  # GET /etiquetas/new
  # GET /etiquetas/new.xml
  def new
    @etiqueta = Etiqueta.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @etiqueta }
    end
  end

  # GET /etiquetas/1/edit
  def edit
    @etiqueta = Etiqueta.find(params[:id])
  end

  # POST /etiquetas
  # POST /etiquetas.xml
  def create
    @etiqueta = Etiqueta.new(params[:etiqueta])

    respond_to do |format|
      if @etiqueta.save
        flash[:notice] = 'Etiqueta was successfully created.'
        format.html { redirect_to(@etiqueta) }
        format.xml  { render :xml => @etiqueta, :status => :created, :location => @etiqueta }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @etiqueta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /etiquetas/1
  # PUT /etiquetas/1.xml
  def update
    @etiqueta = Etiqueta.find(params[:id])

    respond_to do |format|
      if @etiqueta.update_attributes(params[:etiqueta])
        flash[:notice] = 'Etiqueta was successfully updated.'
        format.html { redirect_to(@etiqueta) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @etiqueta.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /etiquetas/1
  # DELETE /etiquetas/1.xml
  def destroy
    @etiqueta = Etiqueta.find(params[:id])
    @etiqueta.destroy

    respond_to do |format|
      format.html { redirect_to(etiquetas_url) }
      format.xml  { head :ok }
    end
  end
end
