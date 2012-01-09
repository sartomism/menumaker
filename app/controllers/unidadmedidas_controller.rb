class UnidadmedidasController < ApplicationController
  # GET /unidadmedidas
  # GET /unidadmedidas.xml
  def index
    @unidadmedidas = Unidadmedida.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidadmedidas }
    end
  end

  # GET /unidadmedidas/1
  # GET /unidadmedidas/1.xml
  def show
    @unidadmedida = Unidadmedida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unidadmedida }
    end
  end

  # GET /unidadmedidas/new
  # GET /unidadmedidas/new.xml
  def new
    @unidadmedida = Unidadmedida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unidadmedida }
    end
  end

  # GET /unidadmedidas/1/edit
  def edit
    @unidadmedida = Unidadmedida.find(params[:id])
  end

  # POST /unidadmedidas
  # POST /unidadmedidas.xml
  def create
    @unidadmedida = Unidadmedida.new(params[:unidadmedida])

    respond_to do |format|
      if @unidadmedida.save
        flash[:notice] = 'Unidadmedida was successfully created.'
        format.html { redirect_to(@unidadmedida) }
        format.xml  { render :xml => @unidadmedida, :status => :created, :location => @unidadmedida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unidadmedida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unidadmedidas/1
  # PUT /unidadmedidas/1.xml
  def update
    @unidadmedida = Unidadmedida.find(params[:id])

    respond_to do |format|
      if @unidadmedida.update_attributes(params[:unidadmedida])
        flash[:notice] = 'Unidadmedida was successfully updated.'
        format.html { redirect_to(@unidadmedida) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unidadmedida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unidadmedidas/1
  # DELETE /unidadmedidas/1.xml
  def destroy
    @unidadmedida = Unidadmedida.find(params[:id])
    @unidadmedida.destroy

    respond_to do |format|
      format.html { redirect_to(unidadmedidas_url) }
      format.xml  { head :ok }
    end
  end
end
