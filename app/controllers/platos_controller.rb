class PlatosController < ApplicationController
  # GET /platos
  # GET /platos.xml
  def index
    @platos = Plato.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @platos }
    end
  end

  # GET /platos/1
  # GET /platos/1.xml
  def show
    @plato = Plato.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plato }
    end
  end

  # GET /platos/new
  # GET /platos/new.xml
  def new
    @plato = Plato.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plato }
    end
  end

  # GET /platos/1/edit
  def edit
    @plato = Plato.find(params[:id])
  end

  # POST /platos
  # POST /platos.xml
  def create
    @plato = Plato.new(params[:plato])

    respond_to do |format|
      if @plato.save
        flash[:notice] = 'Plato was successfully created.'
        format.html { redirect_to(@plato) }
        format.xml  { render :xml => @plato, :status => :created, :location => @plato }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /platos/1
  # PUT /platos/1.xml
  def update
    @plato = Plato.find(params[:id])

    respond_to do |format|
      if @plato.update_attributes(params[:plato])
        flash[:notice] = 'Plato was successfully updated.'
        format.html { redirect_to(@plato) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plato.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /platos/1
  # DELETE /platos/1.xml
  def destroy
    @plato = Plato.find(params[:id])
    @plato.destroy

    respond_to do |format|
      format.html { redirect_to(platos_url) }
      format.xml  { head :ok }
    end
  end
end
