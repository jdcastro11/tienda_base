class PruebaController < ApplicationController
    def index  
        @valorparametros=Valorparametro.all
        render  layout: 'admin' , template: "valorparametros/index"     
    end

end
