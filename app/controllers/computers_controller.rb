class ComputersController < ApplicationController
  layout 'products_layout'
  
  def index
    @computers = Computer.find(:all)
    session[:compare_category] = 'computers'
    render :search
  end
  
  def show
    @computer = Computer.find(params[:product_id])
  end
  
  def select_for_compare
    action, id = params[:compare][:product_id].split('-')
    
    if session[:compare_category] != 'computers'
      session[:compare_category] = 'computers'
      session.delete(:selected_items)
    end
        
    case action
      when 'a'
        (session[:selected_items] ||= []) << id
      when 'd'
        session[:selected_items].delete(id)
    end
    
    respond_to do |format|
      format.js
    end
  end
  
  def compare
    @selected_items = []
    
    session[:selected_items].each do |item|
      @selected_items = (@selected_items + Computer.find(item))
    end
  end
  
  def new
    if params[:marca]
      @computers = Computer.find(:all, :conditions => {:marca => params[:marca][:value]})
    else
      @computers = Computer.find(:all)
    end
    @boolean_opt = [["Si",1], ["No",0]]
    @numbers_opt = [["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8],["9",9],["10",10],
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
  
  def save
    c = Computer.new(params[:computer])
    
    if c.save
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
  
  def update
    @updated_comp = Computer.find(params[:id])
    if @updated_comp.update_attributes(params[:computer])
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
  
  def delete
    if Computer.destroy(params[:id])
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
end
