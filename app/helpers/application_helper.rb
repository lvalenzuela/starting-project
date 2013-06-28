module ApplicationHelper
  def compare_list_count
    if session[:selected_items].nil?
      return 0
    else
      return session[:selected_items].length
    end
  end
  
  def compare_path
    return session[:compare_category]
  end
  
  def generate_unique_form_id
    SecureRandom.uuid.to_s
  end
end
