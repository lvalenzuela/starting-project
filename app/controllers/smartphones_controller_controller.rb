class SmartphonesControllerController < ApplicationController
  
  def index
    @smartphones = Smartphone.find(:all)
    
  end
  
  def show
    @smartphone = Smartphone.find(params[:id])

    #Lista de imagenes correspondientes a un producto
    #se considera un default de 4 imagenes por producto
    @image_paths = []
    marca = Marca.find(@smartphone.marca_id).nombre_marca
    modelo = @smartphone.modelo.upcase
    (1..4).each do |image|
      img_path = 'smartphone_images/'+marca+'/'+modelo+'/'+image.to_s+'.jpg'
      if File.exist?(Rails.root.join('app','assets','images', img_path))
        @image_paths << img_path
      end
    end
  end
  
  def select_for_compare    
    params[:product].each do |product|
      action, id = product.split('-')
      
      if session[:compare_category] != 'smartphones'
        session[:compare_category] = 'smartphones'
        session.delete(:selected_items)
      end
          
      case action
        when 'a'
          (session[:selected_items] ||= []) << Smartphone.find(:first, :select => 'id, img_ref, marca_id, modelo, precio', :conditions => {:id => id})#id.to_i
        when 'd'
          if session[:selected_items].nil?
            session[:selected_items] = []
          else
            session[:selected_items].delete_if{|x| x.id == id.to_i}
          end
      end
    end
    
    respond_to do |format|
      format.js
    end
  end
  
  def compare
    @selected_items = []
    
    @items_to_compare = params[:compare_items].length
    
    params[:compare_items].each do |item|
      @selected_items << Smartphone.find(:first, :conditions => {:id => item})
    end
  end

  def new
    if params[:marca]
      @smartphones = Smartphone.find(:all, :conditions => {:marca_id => params[:marca_id][:value]})
    else
      @smartphones = Smartphone.find(:all)
    end
    @smartphones = Smartphone.new # Nuevo registro a ingresar    
  end
  
   def search
    #FILTRO POR CATEGORIA
    if params[:search][:category] == "any"
      @smartphones = Smartphone.find(:all)
    else
      if params[:search][:category] == "all_in_one"
        @smartphones = Smartphone.find(:all, :conditions => {:categoria => 1})
      end
      if params[:search][:category] == "notebook"
        @smartphones = Smartphone.find(:all, :conditions => {:categoria => 2})
      end
      if params[:search][:category] == 'ultrabook'
        @smartphones = Smartphone.find(:all, :conditions => {:categoria => 3})
      end
    end
    
    #FILTRO POR MARCA DE PROCESADOR
    if params[:search][:proce_id] == "any"
      #no se hace nada
    else
      if params[:search][:proce_id] == "amd"
        @smartphones = @smartphones.select{|s| s.proce_marca_id == 1}
      end
      if params[:search][:proce_id] == 'intel'
        @smartphones = @smartphones.select{|s| s.proce_marca_id == 2}
      end
    end
  
    #FILTRO POR MARCA
    if params[:search][:marca_id] != ""
      @smartphones = @smartphones.select{|s| s.marca_id.to_s == params[:search][:marca_id]}
    end
    
    #FILTRO POR TAMAÑO DE PANTALLA
    if params[:search][:screen_size] != ""
      @smartphones = @smartphones.select{|s| s.screen_size.to_s == params[:search][:screen_size]}
    end
    
    #FILTRO POR SISTEMA OPERATIVO
    if params[:search][:sist_operativo_id] != ""
      @smartphones = @smartphones.select{|s| s.sist_operativo_id.to_s == params[:search][:sist_operativo_id]}
    end
    
    respond_to do |format|
      format.js #search.js.erb
    end
  end
  
  def create
    @smartphone = Smartphone.new(params[:smartphone])
    
    if @smartphone.save
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
  
  def edit
    @smartphone = Smartphone.find(params[:id])
  end
  
  def update
    @smartphone = Smartphone.find(params[:id])
    if @smartphone.update_attributes(params[:smartphone])
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
  
  def destroy
    if Smartphone.destroy(params[:id])
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
  
end

