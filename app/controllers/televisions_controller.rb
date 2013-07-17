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

	end
end
