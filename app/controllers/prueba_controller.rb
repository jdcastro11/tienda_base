class PruebaController < ApplicationController
    include Servicios
    def index  
        @xx=TraerUsuario(36,1)
        pp("clientes Activos",@xx)
    end

end
