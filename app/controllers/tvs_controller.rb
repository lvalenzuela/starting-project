class TvsController < ApplicationController
  def index
    @televisions = Television.find(:all)
    session[:compare_category] = 'computadores'
    session[:selected_items] ||= []
    render :search
  end

  def new
  	if params[:marca_id]
  		@televisions = Television.find(:all, :conditions => {:marca_id => params[:marca_id][:value]})
  	else
  		@televisions = Television.find(:all)
  	end
  	@television = Television.new #nuevo televisor a registrar
  end

  def create
  	@television = Television.new(params[:television])

  	if @television.save
  		redirect_to :action => 'new'
  	else
  		redirect_to :action => 'error'
  	end
  end

  def edit
  	@television = Television.find(params[:id])
  end

  def update
  	@television = Television.find(params[:id])

  	if @television.update_attributes(params[:television])
  		redirect_to :action => 'new'
  	else
  		redirect_to :action => 'error'
  	end
  end

  def destroy
  	if Television.destroy(params[:id])
  		redirect_to :action => 'new'
  	else
  		redirect_to :action => 'error'
  	end
  end

  def search
  end
end
