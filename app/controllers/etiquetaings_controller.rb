class EtiquetaingsController < ApplicationController
  # GET /etiquetaings
  # GET /etiquetaings.xml
  def index
    @etiquetaings = Etiquetaing.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @etiquetaings }
    end
  end

  # GET /etiquetaings/1
  # GET /etiquetaings/1.xml
  def show
    @etiquetaing = Etiquetaing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @etiquetaing }
    end
  end

  # GET /etiquetaings/new
  # GET /etiquetaings/new.xml
  def new
    @etiquetaing = Etiquetaing.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @etiquetaing }
    end
  end

  # GET /etiquetaings/1/edit
  def edit
    @etiquetaing = Etiquetaing.find(params[:id])
  end

  # POST /etiquetaings
  # POST /etiquetaings.xml
  def create
    @etiquetaing = Etiquetaing.new(params[:etiquetaing])

    respond_to do |format|
      if @etiquetaing.save
        flash[:notice] = 'Etiquetaing was successfully created.'
        format.html { redirect_to(@etiquetaing) }
        format.xml  { render :xml => @etiquetaing, :status => :created, :location => @etiquetaing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @etiquetaing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /etiquetaings/1
  # PUT /etiquetaings/1.xml
  def update
    @etiquetaing = Etiquetaing.find(params[:id])

    respond_to do |format|
      if @etiquetaing.update_attributes(params[:etiquetaing])
        flash[:notice] = 'Etiquetaing was successfully updated.'
        format.html { redirect_to(@etiquetaing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @etiquetaing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /etiquetaings/1
  # DELETE /etiquetaings/1.xml
  def destroy
    @etiquetaing = Etiquetaing.find(params[:id])
    @etiquetaing.destroy

    respond_to do |format|
      format.html { redirect_to(etiquetaings_url) }
      format.xml  { head :ok }
    end
  end
end
