class CarsController < ApplicationController
  layout 'cars_layout'
  
  def index
    @cars = Car.find(:all)
    render :search
  end
  
  def new
    if params[:marca]
      @cars = Car.find(:all, :conditions => {:marca => params[:marca][:value]})
    else
      @cars = Car.find(:all)
    end
    @boolean_opt = [["Si",1], ["No",0]]
  end
  
  def search
    #FILTRO POR BODY STYLE
    if params[:search][:body_all] == 'body_all'
      @cars = Car.find(:all)
    else
      @cars = []
      if params[:search][:cargo_van] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 1}))
      end
      if params[:search][:coupe] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 2}))
      end
      if params[:search][:suv_crossover] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 3}))
      end
      if params[:search][:hatchback] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 4}))
      end
      if params[:search][:pick_up_simple] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 5}))
      end
      if params[:search][:pick_up_doble] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 6}))
      end
      if params[:search][:sedan] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 7}))
      end
      if params[:search][:station_wagon] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 8}))
      end
      if params[:search][:convertible] == '1'
        @cars = (@cars + Car.find(:all, :conditions => {:body_style => 9}))
      end
    end
    
    #FILTRO POR MARCA
    if params[:search][:marca] != ""
      @cars = @cars.select{|s| s.marca.to_s == params[:search][:marca]}
    end
    
    #FILTRO POR TRANSMISION
    if params[:search][:transmision] != ""
      @cars = @cars.select{|s| s.transmision.to_s == params[:search][:transmision]}
    end
    
    #FILTRO POR TRACCION
    if params[:search][:traccion] != ""
      @cars = @cars.select{|s| s.traccion.to_s == params[:search][:traccion]}      
    end
    
    #FILTRO POR COMBUSTIBLE
    if params[:search][:combustible] != ""
      @cars = @cars.select{|s| s.combustible.to_s == params[:search][:combustible]}
    end

    respond_to do |format|
      format.js #search.js.erb
    end
  end
  
  def save   
    #CAR
    c = Car.new(params[:car])
    
    if c.save
      redirect_to :action => "new"
    else
      redirect_to :action => "error"
    end
  end
    
  def update
    @updated_car = Car.find(params[:id])
    if @updated_car.update_attributes(params[:car])
      redirect_to :action => "new"
    else
      redirect_to :action => "error"
    end
   
  end
  
  def edit
    @car = Car.find(params[:id])
    @boolean_opt = [["Si",1], ["No",0]]
  end
  
  def delete
    if Car.destroy(params[:id])
      redirect_to :action => "new"
    else
      redirect_to :action => "error"
    end
  end
end
