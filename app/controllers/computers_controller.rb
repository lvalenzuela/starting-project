class ComputersController < ApplicationController
  #layout 'products_layout'
  
  def index
    @computers = Computer.find(:all)
    session[:compare_category] = 'computers'
    render :search
  end
  
  def show
    @computer = Computer.find(params[:id])

    #Lista de imagenes correspondientes a un producto
    #se considera un default de 4 imagenes por producto
    @image_paths = []
    marca = ComputersMarca.find(@computer.marca).marca
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
      
      if session[:compare_category] != 'computers'
        session[:compare_category] = 'computers'
        session.delete(:selected_items)
      end
          
      case action
        when 'a'
          (session[:selected_items] ||= []) << id.to_i
        when 'd'
          if session[:selected_items].nil?
            session[:selected_items] = []
          else
            session[:selected_items].delete(id.to_i)
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
      @selected_items = (@selected_items + Computer.find(:all, :conditions => {:id => item}))
    end
  end
  
  def new
    if params[:marca]
      @computers = Computer.find(:all, :conditions => {:marca => params[:marca][:value]})
    else
      @computers = Computer.find(:all)
    end
    @computer = Computer.new # Nuevo registro a ingresar    
    @boolean_opt = [["Si",1], ["No",0]]
    @numbers_opt = [["0",0],["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],
    ["11",11],["12",12],["13",13],["14",14],["15",15],["16",16]]
  end
  
  def search
    
    #FILTRO POR CATEGORIA
    if params[:search][:category] == "any"
      @computers = Computer.find(:all)
    else
      if params[:search][:category] == "all_in_one"
        @computers = Computer.find(:all, :conditions => {:categoria => 1})
      end
      if params[:search][:category] == "notebook"
        @computers = Computer.find(:all, :conditions => {:categoria => 2})
      end
      if params[:search][:category] == 'ultrabook'
        @computers = Computer.find(:all, :conditions => {:categoria => 3})
      end
    end
    
    #FILTRO POR MARCA DE PROCESADOR
    if params[:search][:proce] == "any"
      #no se hace nada
    else
      if params[:search][:proce] == "amd"
        @computers = @computers.select{|s| s.proce_marca == 1}
      end
      if params[:search][:proce] == 'intel'
        @computers = @computers.select{|s| s.proce_marca == 2}
      end
    end
  
    #FILTRO POR MARCA
    if params[:search][:marca] != ""
      @computers = @computers.select{|s| s.marca.to_s == params[:search][:marca]}
    end
    
    #FILTRO POR TAMAÑO DE PANTALLA
    if params[:search][:screen_size] != ""
      @computers = @computers.select{|s| s.screen_size.to_s == params[:search][:screen_size]}
    end
    
    #FILTRO POR SISTEMA OPERATIVO
    if params[:search][:sist_operativo] != ""
      @computers = @computers.select{|s| s.sist_operativo.to_s == params[:search][:sist_operativo]}
    end
    
    respond_to do |format|
      format.js #search.js.erb
    end
  end
  
  def create
    @computer = Computer.new(params[:computer])
    
    if @computer.save
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end

  def edit
    @computer = Computer.find(params[:id])
    @boolean_opt = [["Si",1], ["No",0]]
    @numbers_opt = [["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8]]
  end
  
  def update
    @computer = Computer.find(params[:id])
    if @computer.update_attributes(params[:computer])
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
end
