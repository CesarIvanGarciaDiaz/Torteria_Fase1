class Torta
attr_accessor :type_tortas,:tiempo ,:cantidad_tortas
  def initialize(type_tortas,tiempo,cantidad_tortas)
    @type_tortas = type_tortas
    @tiempo=tiempo
    @cantidad_tortas =cantidad_tortas
  end
end
