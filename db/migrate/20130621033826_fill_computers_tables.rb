class FillComputersTables < ActiveRecord::Migration
  def up
    execute "TRUNCATE computers_marcas"
    execute "TRUNCATE computers_categories"
    execute "TRUNCATE computers_memoria"
    execute "TRUNCATE computers_proces"
    execute "TRUNCATE computers_screen_resols"
    execute "TRUNCATE computers_screen_sizes"
    execute "TRUNCATE computers_screen_types"
    execute "TRUNCATE computers_sos"
    
    #CATEGORY
    ComputersCategory.create(:category => 'All In One')
    ComputersCategory.create(:category => 'Notebook / Laptop')
    
    #MARCAS
    ComputersMarca.create(:marca => 'Acer')
    ComputersMarca.create(:marca => 'Apple')
    ComputersMarca.create(:marca => 'Asus')
    ComputersMarca.create(:marca => 'Compaq')
    ComputersMarca.create(:marca => 'Dell')
    ComputersMarca.create(:marca => 'HP')
    ComputersMarca.create(:marca => 'Packard Bell')
    ComputersMarca.create(:marca => 'Lenovo')
    ComputersMarca.create(:marca => 'MSI')
    ComputersMarca.create(:marca => 'Samsung')
    ComputersMarca.create(:marca => 'Sony')
    ComputersMarca.create(:marca => 'Toshiba')
    
    #MEMORIA
    ComputersMemoria.create(:tipo => 'DDR')
    ComputersMemoria.create(:tipo => 'DDR2')
    ComputersMemoria.create(:tipo => 'DDR3')
    ComputersMemoria.create(:tipo => 'DDR4')
    ComputersMemoria.create(:tipo => 'DDR5')
    
    #PROCESADOR
    ComputersProce.create(:marca => 'AMD')
    ComputersProce.create(:marca => 'Intel')
    
    #RESOLUCIONES DE PANTALLA
    ComputersScreenResol.create(:resolucion => '1024 x 768')
    ComputersScreenResol.create(:resolucion => '1152 x 864')
    ComputersScreenResol.create(:resolucion => '1280 x 720')
    ComputersScreenResol.create(:resolucion => '1280 x 768')
    ComputersScreenResol.create(:resolucion => '1280 x 800')
    ComputersScreenResol.create(:resolucion => '1280 x 960')
    ComputersScreenResol.create(:resolucion => '1280 x 1024')
    ComputersScreenResol.create(:resolucion => '1360 x 768')
    ComputersScreenResol.create(:resolucion => '1366 x 768')
    ComputersScreenResol.create(:resolucion => '1440 x 900')
    ComputersScreenResol.create(:resolucion => '1600 x 900')
    ComputersScreenResol.create(:resolucion => '1600 x 1200')
    ComputersScreenResol.create(:resolucion => '1600 x 1050')
    ComputersScreenResol.create(:resolucion => '1920 x 1080')
    ComputersScreenResol.create(:resolucion => '1920 x 1200')
    ComputersScreenResol.create(:resolucion => '2560 x 1440')
    
    #SCREEN SIZES
    ComputersScreenSize.create(:size => '11.6"')
    ComputersScreenSize.create(:size => '12.5"')
    ComputersScreenSize.create(:size => '13.3"')
    ComputersScreenSize.create(:size => '14.0"')
    ComputersScreenSize.create(:size => '15.4"')
    ComputersScreenSize.create(:size => '15.5"')
    ComputersScreenSize.create(:size => '15.6"')
    ComputersScreenSize.create(:size => '17.3"')
    ComputersScreenSize.create(:size => '18.5"')
    ComputersScreenSize.create(:size => '20.0"')
    ComputersScreenSize.create(:size => '21.5"')
    ComputersScreenSize.create(:size => '23.0"')
    ComputersScreenSize.create(:size => '24.0"')
    ComputersScreenSize.create(:size => '27.0"')

    #SCREEN TYPES
    ComputersScreenType.create(:tipo => 'LCD')
    ComputersScreenType.create(:tipo => 'LED')
    ComputersScreenType.create(:tipo => 'Retina Display')
    
    #SISTEMAS OPERATIVOS
    ComputersSo.create(:sist_operativo => 'Windows 8')
    ComputersSo.create(:sist_operativo => 'Windows 8 Pro')
    ComputersSo.create(:sist_operativo => 'Mac OS X')
    ComputersSo.create(:sist_operativo => 'Linux')
  end

  def down
    ComputersCategory.destroy_all
    ComputersMarca.destroy_all
    ComputersMemoria.destroy_all
    ComputersProce.destroy_all
    ComputersScreenResol.destroy_all
    ComputersScreenSize.destroy_all
    ComputersScreenType.destroy_all
    ComputersSo.destroy_all
  end
end
