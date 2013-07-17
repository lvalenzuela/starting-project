module ApplicationHelper
  
  def display_size_select(category)
    categoria = Categoria.find(:first, :conditions => {:nombre  => category })
    
    return categoria.display_sizes.all.collect{|s| [s.size, s.id]}
  end

  def display_tech_select(category)
    categoria = Categoria.find(:first, :conditions => {:nombre => category})

    return categoria.display_teches.all.collect{|d| [d.nombre, d.id]}
  end

  def marcas_select(category)
    categoria = Categoria.find(:first, :conditions => {:nombre => category})

    return categoria.marcas.all.collect{|m| [m.nombre_marca, m.id]}
  end

  def red_select(tipo_red)
    case tipo_red
    when 'wifi'
      red = Red.find(:first, :conditions => {:nombre => 'Wi-Fi'})
      return red.red_protocols.all.collect{|r| [r.nombre,r.id]}
    when 'bluetooth'
      red = Red.find(:first, :conditions => {:nombre => 'Bluetooth'})
      return red.red_protocols.all.collect{|r| [r.nombre, r.id]}
    end
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
