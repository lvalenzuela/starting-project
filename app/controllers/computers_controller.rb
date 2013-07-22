class ComputersController < ApplicationController
  #layout 'products_layout'
  helper_method :sort_column, :sort_direction

  def index
    session[:compare_category] = 'computadores'
    session[:selected_items] ||= []
    if params[:search]
      @computers = search(params)
    else
      @computers = Computer.find(:all, :limit => 20)
    end

    respond_to do |format|
      format.js #search.js.erb
      format.html
    end
  end
  
  def show
    @computer = Computer.find(params[:id])

    #Lista de imagenes correspondientes a un producto
    #se considera un default de 4 imagenes por producto
    @image_paths = []
    marca = Marca.find(@computer.marca_id).nombre_marca
    modelo = @computer.modelo.upcase
    (1..4).each do |image|
      img_path = 'computer_images/'+marca+'/'+modelo+'/'+image.to_s+'.jpg'
      if File.exist?(Rails.root.join('app','assets','images', img_path))
        @image_paths << img_path
      end
    end
  end
  
  def select_for_compare
    
    params[:product].each do |product|
      action, id = product.split('-')
      
      if session[:compare_category] != 'computadores'
        session[:compare_category] = 'computadores'
        session.delete(:selected_items)
      end
          
      case action
        when 'a'
          (session[:selected_items] ||= []) << Computer.find(:first, :select => 'id, img_ref, marca_id, modelo, precio', :conditions => {:id => id})#id.to_i
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
      @selected_items << Computer.find(:first, :conditions => {:id => item})
    end
  end

  def new
    if params[:marca_id]
      @computers = Computer.find(:all, :conditions => {:marca_id => params[:marca_id][:value]})
    else
      @computers = Computer.find(:all)
    end
    @aditional_features = ComputerAditionalFeature.find(:all)
    @computer = Computer.new # Nuevo registro a ingresar    
  end

  def new_feature
    @feature = ComputerAditionalFeature.new(params[:new_feature])
    if @feature.save
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end

  def alternative_new
    #Metodo de inserción de usuarios alternativo
    @aditional_features = ComputerAditionalFeature.find(:all)
    @computer = Computer.new # Nuevo registro a ingresar
  end
  
  def create
    @computer = Computer.new(params[:computer])
    #Incluir los tipos de dato
    if @computer.bateria_duracion != ''
      @computer.bateria_duracion = @computer.bateria_duracion + " " + params[:batery_life]
    end
    if @computer.proce_velocidad != ''
      @computer.proce_velocidad = @computer.proce_velocidad + " " + params[:proce_speed]
    end
    if @computer.memoria != ''
      @computer.memoria = @computer.memoria + " " + params[:ram_storage]
    end
    if @computer.memoria_velocidad != ''
      @computer.memoria_velocidad = @computer.memoria_velocidad + " " + params[:ram_speed]
    end
    if @computer.memoria_max != ''
      @computer.memoria_max = @computer.memoria_max + " " + params[:ram_max_storage]
    end
    if @computer.disco_capacidad != ''
      @computer.disco_capacidad = @computer.disco_capacidad + " " + params[:disc_storage]
    end
    if @computer.disco_velocidad != ''
      @computer.disco_velocidad = @computer.disco_velocidad + " " + params[:disc_speed]
    end
    if @computer.disco_ssd != ''
      @computer.disco_ssd = @computer.disco_ssd + " " + params[:disc_ssd_storage]
    end
    if @computer.video_memoria.to_s != ''
      @computer.video_memoria = @computer.video_memoria + " " + params[:video_storage]
    end

    if @computer.save
      new_computer = Computer.find(:last)
      
      params[:features].each do |feature|
        action, id = feature.split('-')
        case action
        when 'a'
          MapComputerAditionalFeature.create(:computer_id => new_computer.id, :computer_aditional_feature_id => id)
        end
      end
      
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end

  def edit
    @aditional_features = ComputerAditionalFeature.find(:all)

    @computer = Computer.find(params[:id])
  end
  
  def update
    @computer = Computer.find(params[:id])
    if @computer.update_attributes(params[:computer])

      params[:features].each do |feature|
        action, id = feature.split('-')
        case action
        when 'a'
          if MapComputerAditionalFeature.where('computer_id = ? AND computer_aditional_feature_id = ?',@computer.id, id).empty?
            MapComputerAditionalFeature.create(:computer_id => @computer.id, :computer_aditional_feature_id => id)
          end
        when 'd'
          MapComputerAditionalFeature.where('computer_id = ? AND computer_aditional_feature_id = ?',@computer.id, id).destroy_all
        end
      end
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
  
  def destroy
    if Computer.destroy(params[:id])
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end

  private

  def search params = {}
    
    computers = sort(params[:search][:sort], params[:search][:direction])
    
    #FILTRO POR CATEGORIA
    if params[:search][:category] == "any"
      #no se hace nada
    else
      computers = computers.select{|s| s.categoria == params[:search][:category]}
    end
    
    #FILTRO POR MARCA DE PROCESADOR
    if params[:search][:proce_id] == "any"
      #no se hace nada
    else
      computers = computers.select{|s| s.proce_marca_id.to_s == params[:search][:proce_id]}
    end
  
    #FILTRO POR MARCA
    if params[:search][:marca_id] != ""
      computers = computers.select{|s| s.marca_id.to_s == params[:search][:marca_id]}
    end
    
    #FILTRO POR TAMAÑO DE PANTALLA
    if params[:search][:screen_size] != ""
      computers = computers.select{|s| s.screen_size.to_s == params[:search][:screen_size]}
    end
    
    #FILTRO POR SISTEMA OPERATIVO
    if params[:search][:sist_operativo_id] != ""
      computers = computers.select{|s| s.sist_operativo_id.to_s == params[:search][:sist_operativo_id]}
    end
    

    #entregar los primeros 20 resultados
    computers = computers.first(20)
  end

  def sort(column, direction)
    #sort by column
    categoria = Categoria.where(:nombre => 'computadores')
    case column
    when 'marca_id'
      computers = Computer.find_by_sql("SELECT * FROM computers, marcas WHERE computers.marca_id = marcas.id ORDER BY marcas.nombre_marca "+ direction) 
    when 'categoria'
      computers = Computer.find_by_sql("SELECT * FROM computers, computers_categories WHERE computers.categoria = computers_categories.id ORDER BY computers_categories.category " + direction)
    when 'modelo'
      computers = Computer.find(:all, :order => 'modelo ' + direction)
    when 'screen_size'
      computers = Computer.find_by_sql("SELECT * FROM computers, display_sizes WHERE computers.screen_size = display_sizes.id ORDER BY display_sizes.size " + direction)
    when 'precio'
      computers = Computer.find(:all, :order => 'precio ' + direction)
    else
      computers = Computer.find_by_sql("SELECT * FROM computers, marcas WHERE computers.marca_id = marcas.id ORDER BY marcas.nombre_marca ASC") 
    end
  end

  def sort_column
    if params[:search]
      Computer.column_names.include?(params[:search][:sort]) ? params[:search][:sort] : "marca_id"
    else
      'marca_id'
    end
  end

  def sort_direction
    if params[:search]
      %w[asc desc].include?(params[:search][:direction]) ? params[:search][:direction] : "asc"
    else
      'asc'
    end
  end
end
