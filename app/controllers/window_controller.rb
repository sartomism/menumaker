class WindowController < ApplicationController
  
  def index
    
    @modelos = ActiveRecord::Base.connection.tables.map {|t| t.singularize };
    
    mod="Pack"
    
    @columns = eval(mod+".columns").map {|c| c.name.to_s + " - " + c.type.to_s}
    
  end

  def show_window
    @modelo = params[:window][:modelo].capitalize
    #@databases = ActiveRecord::Base.connection.execute("show databases");
    @columns = eval(@modelo.to_s+".columns") #.map {|c| c.name.to_s + " - " + c.type.to_s}
  end
  
  
end
