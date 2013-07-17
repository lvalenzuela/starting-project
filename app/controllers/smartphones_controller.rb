class SmartphonesController < ApplicationController
  
  def index
    @smartphones = Smartphone.find(:all)
    session[:compare_category] = 'smartphones'
    session[:selected_items] ||= []
    render :search
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
  
  def search # esta funcion rq hay que cambiarla entera, para adecuarla a la especificidad de smartphones
    #FILTRO POR SISTEMA OPERATIVO (Check box, change)
    if params[:search][:os_all] == '1'
      @smartphones = Smartphone.find(:all) 
      #@smartphones.select{|s| s.sistema_operativo_id.to_s == params[:search][:sistema_operativo_id]}
    else
      @smartphones = []
      if [:params][:os_android] == '1'
        @smartphones = (@smartphones + Smartphone.find(:all, :conditions => {:sistema_operativo_id => 'TO BE'}))
      end
      if [:params][:os_blackberry] == '1'
        @smartphones = (@smartphones + Smartphone.find(:all, :conditions => {:sistema_operativo_id => 'TO BE'}))
      end
      if [:params][:os_ios] == '1'
        @smartphones = (@smartphones + Smartphone.find(:all, :conditions => {:sistema_operativo_id => 'TO BE'}))
      end
      if [:params][:os_symbian] == '1'
        @smartphones = (@smartphones + Smartphone.find(:all, :conditions => {:sistema_operativo_id => 'TO BE'}))
      end
      if [:params][:os_win_mob] == '1'
        @smartphones = (@smartphones + Smartphone.find(:all, :conditions => {:sistema_operativo_id => 'TO BE'}))
      end
      if [:params][:os_win_ph] == '1'
        @smartphones = (@smartphones + Smartphone.find(:all, :conditions => {:sistema_operativo_id => 'TO BE'}))
      end
    end        
    
    #FILTRO POR MARCA (drop down list, ok)
    if params[:search][:marca_id] != ""
      @smartphones = @smartphones.select{|s| s.marca_id.to_s == params[:search][:marca_id]}
    end
    
    #FILTRO POR TAMAÑO DE PANTALLA (esto lo quiero hacer con slider asi que habra que cambiarlo)
    if params[:search][:screen_size] != ""
      @smartphones = @smartphones.select{|s| s.display_size_id.to_s == params[:search][:screen_size]}
    end
    
    #FILTRO POR CALDAD DE CAMARA (esto lo qiuero hacer con slider asi que habra que cambiarlo)
    if params[:search][:camara_q] != ""
      @smartphones = @smartphones.select{|s| s.cam_resolution.to_s == params[:search][:camara_q]}
    end
    
    #FILTRO POR REDES
    @smart_2g = []
    @smart_3g = []
    @smart_4g = []
    #AGREGAR MAS EVENTUALMENTE
    if params[:search][:net_all] == '1'
      #aca no se hace nadita
    else
      if params[:search][:net_2g] == '1'
        red_2g = Red.find(:all, :conditions => {:nombre => "3g"})
        @smart_2g = red_2g.smartphones.all
      end
      if params[:search][:net_3g] == '1'
        red_3g = Red.find(:all, :conditions => {:nombre => "TO BE"})
        @smart_3g = red_3g.smartphones.all
      end
      if params[:search][:net_4g] == '1'
        red_4g = Red.find(:all, :conditions => {:nombre => "TO BE"})
        @smart_4g = red_4g.smartphones.all
      end
      #ACA HAY QUE PONER EL RESTO DE LAS REDES EVENTUALMENTE
      @smartphones = @smart_2g + @smart_3g + @smart_4g
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