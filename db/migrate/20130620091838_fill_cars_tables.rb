class FillCarsTables < ActiveRecord::Migration
  def up
    #VACIA LAS TABLAS PARA QUE LOS CONTADORES DE ID PARTAN EN 1
    execute "TRUNCATE cars_body_styles"
    execute "TRUNCATE cars_combustibles"
    execute "TRUNCATE cars_marcas"
    execute "TRUNCATE cars_transmisions"
    execute "TRUNCATE cars_traccions"
    
    #BODY STYLE
    CarsBodyStyle.create(:body_style => 'Cargo Van / Furgon')
    CarsBodyStyle.create(:body_style => 'Coupe')
    CarsBodyStyle.create(:body_style => 'SUV / Crossover')
    CarsBodyStyle.create(:body_style => 'Hatchback')
    CarsBodyStyle.create(:body_style => 'Pick Up Cabina Simple')
    CarsBodyStyle.create(:body_style => 'Pick Up Cabina Doble')
    CarsBodyStyle.create(:body_style => 'Sedan')
    CarsBodyStyle.create(:body_style => 'Station Wagon')
    CarsBodyStyle.create(:body_style => 'Convertible')    
    
    #COMBUSTIBLES
    CarsCombustible.create(:combustible => 'Bencina')
    CarsCombustible.create(:combustible => 'Diesel')
    
    #MARCAS
    CarsMarca.create(:marca => 'Alfa Romeo')
    CarsMarca.create(:marca => 'Aston Martin')
    CarsMarca.create(:marca => 'Audi')
    CarsMarca.create(:marca => 'Brilliance')
    CarsMarca.create(:marca => 'BYD')
    CarsMarca.create(:marca => 'Changan')
    CarsMarca.create(:marca => 'Chery')
    CarsMarca.create(:marca => 'Chevrolet')
    CarsMarca.create(:marca => 'Chrysler')
    CarsMarca.create(:marca => 'Citroen')
    CarsMarca.create(:marca => 'Daihatsu')
    CarsMarca.create(:marca => 'DFSK')
    CarsMarca.create(:marca => 'Dodge')
    CarsMarca.create(:marca => 'Ferrari')
    CarsMarca.create(:marca => 'Fiat')
    CarsMarca.create(:marca => 'Ford')
    CarsMarca.create(:marca => 'Foton')
    CarsMarca.create(:marca => 'Geely')
    CarsMarca.create(:marca => 'Great Wall')
    CarsMarca.create(:marca => 'Hafei')
    CarsMarca.create(:marca => 'Haima')
    CarsMarca.create(:marca => 'Honda')
    CarsMarca.create(:marca => 'Hummer')
    CarsMarca.create(:marca => 'Hyundai')
    CarsMarca.create(:marca => 'Jac')
    CarsMarca.create(:marca => 'Jaguar')
    CarsMarca.create(:marca => 'Jeep')
    CarsMarca.create(:marca => 'Jimbei')
    CarsMarca.create(:marca => 'JMC')
    CarsMarca.create(:marca => 'Kia')
    CarsMarca.create(:marca => 'Lamborgini')
    CarsMarca.create(:marca => 'Land Rover')
    CarsMarca.create(:marca => 'Lexus')
    CarsMarca.create(:marca => 'Lifan')
    CarsMarca.create(:marca => 'Mahindra')
    CarsMarca.create(:marca => 'Maserati')
    CarsMarca.create(:marca => 'Mazda')
    CarsMarca.create(:marca => 'Mercedes Benz')
    CarsMarca.create(:marca => 'MG')
    CarsMarca.create(:marca => 'Mini')
    CarsMarca.create(:marca => 'Mitsubishi')
    CarsMarca.create(:marca => 'Nissan')
    CarsMarca.create(:marca => 'Opel')
    CarsMarca.create(:marca => 'Peugeot')
    CarsMarca.create(:marca => 'Pontiac')
    CarsMarca.create(:marca => 'Porsche')
    CarsMarca.create(:marca => 'Renault')
    CarsMarca.create(:marca => 'Rolls-Royce')
    CarsMarca.create(:marca => 'Saab')
    CarsMarca.create(:marca => 'Samsung')
    CarsMarca.create(:marca => 'SMA')
    CarsMarca.create(:marca => 'Skoda')
    CarsMarca.create(:marca => 'Ssangyong')
    CarsMarca.create(:marca => 'Subaru')
    CarsMarca.create(:marca => 'Suzuki')
    CarsMarca.create(:marca => 'Tata')
    CarsMarca.create(:marca => 'Toyota')
    CarsMarca.create(:marca => 'Volkswagen')
    CarsMarca.create(:marca => 'ZNA')
    CarsMarca.create(:marca => 'Zotye')
    CarsMarca.create(:marca => 'ZX Auto')
    
    #TRACCIONES
    CarsTraccion.create(:traccion => 'Delantera')
    CarsTraccion.create(:traccion => 'Trasera')
    CarsTraccion.create(:traccion => 'AWD / 4x4')
    
    #TRANSMISIONES
    CarsTransmision.create(:transmision => 'Manual')
    CarsTransmision.create(:transmision => 'Automatica')
  end

  def down
    CarsBodyStyle.destroy_all
    CarsCombustible.destroy_all
    CarsMarca.destroy_all
    CarsTraccion.destroy_all
    CarsTransmision.destroy_all
  end
end
