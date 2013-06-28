module ComputersHelper
  
  def check_if_selected(id)
    if !session[:selected_items].nil?
      session[:selected_items].each do |item|
        if item.to_i == id
          return true
        else
          return false
        end
      end
      else
        return false
    end  
  end
end
