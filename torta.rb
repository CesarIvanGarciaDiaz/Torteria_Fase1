class Torta
attr_accessor :type_tortas,:tiempo ,:cantidad_tortas
  def initialize(type_tortas,tiempo,cantidad_tortas)
    @type_tortas = type_tortas
    @tiempo=tiempo
    @cantidad_tortas =cantidad_tortas
  end
end

class Horno

  def cantidad_tortas(*tortas)
    arr_tortas = Array.new
    $total_tortas = 0
    tortas.each do |torta|
    cant_tortas = torta.cantidad_tortas
    cant_tortas.times do arr_tortas << torta
      end
      $total_tortas = $total_tortas + cant_tortas
    end
    arr_tortas
  end

  def cocer(time_cooking,tortas_type)
    $listo = 0
    $crudo = 0
    $quemado = 0
    arr_status = Array.new
    tortas_type.each do |torta|
      tiempo_dexocion = torta.tiempo
      type_torta = torta.type_tortas
      puts "Torta de #{type_torta}"
      for minutes in 1..time_cooking
        if minutes == tiempo_dexocion - 1
          puts  "#{minutes}. Casi listo"
        elsif minutes < tiempo_dexocion
          puts  "#{minutes}. Crudo"
          arr_status << "1"
        elsif minutes == tiempo_dexocion
          puts  "#{minutes}. Listo"
          arr_status << "2"
        else
          puts  "#{minutes}. Quemado"
          arr_status << "3"
        end
      end
      if arr_status.include? "3"
        $quemado += 1
      elsif arr_status.include? "2"
        $listo += 1
      else
        $crudo += 1
      end
      arr_status
    end
  end
end

horno = Horno.new
torta_huevo = Torta.new("Huevo", 15, 2)
torta_salchicha = Torta.new("Salchicha", 20, 5)
torta_milaneza = Torta.new("Milaneza", 10, 1)
pedido_tortas = horno.cantidad_tortas(torta_huevo, torta_salchicha, torta_milaneza)
horno.cocer(15, pedido_tortas)
puts ""

puts "Se pidieron #{$total_tortas} tortas"
puts "Se quemaron #{$quemado}"
puts "Quedaron listas #{$listo}"
puts "Quedaron crudas #{$crudo}"
