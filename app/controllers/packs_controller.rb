class PacksController < ApplicationController
  # GET /packs
  # GET /packs.xml
  def index
    @packs = Pack.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @packs }
    end
  end

  # GET /packs/1
  # GET /packs/1.xml
  def show
    @pack = Pack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pack }
    end
  end

  # GET /packs/new
  # GET /packs/new.xml
  def new
    @pack = Pack.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pack }
    end
  end

  # GET /packs/1/edit
  def edit
    @pack = Pack.find(params[:id])
  end

  # POST /packs
  # POST /packs.xml
  def create
    @pack = Pack.new(params[:pack])

    respond_to do |format|
      if @pack.save
        flash[:notice] = 'Pack was successfully created.'
        format.html { redirect_to(@pack) }
        format.xml  { render :xml => @pack, :status => :created, :location => @pack }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /packs/1
  # PUT /packs/1.xml
  def update
    @pack = Pack.find(params[:id])

    respond_to do |format|
      if @pack.update_attributes(params[:pack])
        flash[:notice] = 'Pack was successfully updated.'
        format.html { redirect_to(@pack) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pack.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /packs/1
  # DELETE /packs/1.xml
  def destroy
    @pack = Pack.find(params[:id])
    @pack.destroy

    respond_to do |format|
      format.html { redirect_to(packs_url) }
      format.xml  { head :ok }
    end
  end
end
