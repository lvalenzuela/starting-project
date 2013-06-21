class ComputersController < ApplicationController
  
  def index
    @computers = Computer.find(:all)
    render :search
  end
  
  def new
    if params[:marca]
      @computers = Computer.find(:all, :conditions => {:marca => params[:marca][:value]})
    else
      @computers = Computer.find(:all)
    end
    @boolean_opt = [["Si",1], ["No",0]]
    @numbers_opt = [["1",1],["2",2],["3",3],["4",4],["5",5],["6",6],["7",7],["8",8]]
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
    if @updated_comp.update_attibutes(params[:computer])
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
  
  def edit
    @computer = Computer.find(params[:id])
    @boolean_opt = [["Si",1], ["No",0]]
  end
  
  def delete
    if Computer.destroy(params[:id])
      redirect_to :action => 'new'
    else
      redirect_to :action => 'error'
    end
  end
end
