module ApplicationHelper

  def marcas_select(category)
    categoria = Categoria.find(:first, :conditions => {:nombre => category})

    return categoria.marcas.all.collect{|m| [m.nombre_marca, m.id]}
  end

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
  
  def boolean_product_feature(bool_value)
    case bool_value
    when 1
      return 'Si'
    when 0
      return 'No'
    else
      #Atributo no especificado
      return 'No'
    end
  end
end
