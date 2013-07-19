class TelevisionsController < ApplicationController

	def index 
		@televisions = Television.find(:all)
		session[:compare_category] = 'televisores'
		session[:selected_items] ||= []
		render :search
	end

	def show
		@television = Television.find(params[:id])

		@image_paths = []

		marca = Marca.find(@television.marca_id).nombre_marca
		modelo = @television.modelo.upcase
		(1..4).each do |image|
			img_path = 'television_images/'+marca+'/'+modelo+'/'+image.to_s+'.jpg'
			if File.exists?(Rails.root.join('app','assets','images', img_path))
				@image_paths << img_path
			end
		end
	end

	def select_for_compare
	    params[:product].each do |product|
	      action, id = product.split('-')
	      
	      if session[:compare_category] != 'televisores'
	        session[:compare_category] = 'televisores'
	        session.delete(:selected_items)
	      end
	          
	      case action
	        when 'a'
	          (session[:selected_items] ||= []) << Television.find(:first, :select => 'id, img_ref, marca_id, modelo, precio', :conditions => {:id => id})#id.to_i
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
	      @selected_items << Television.find(:first, :conditions => {:id => item})
	    end
	end
end
