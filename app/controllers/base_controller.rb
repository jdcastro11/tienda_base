class BaseController < ApplicationController
    before_action :auth!
    require "pp"
    include Servicios
     #implementando Autenticación
   
     private  
     def auth!
        excepciones=['productos1','mostrarCarrito','agregarCarrito','eliminarCarrito']
       
        uri= request.original_url
        controlador=getControlador(uri)
             
        if excepciones.include?(controlador)          
           return
        end

         if session[:idrol]== ""      
             puts "No hay session"
             redirect_to "/login"
             return                         
         end
     
       # implementando  autorizacion     
         #verb=request.env["REQUEST_METHOD"]
         # accion=action_name  
       
        idrol= session[:idrol]       
        acceso=validarAccesoOpcion(idrol,controlador)
           
          if !acceso 
             redirect_to "/noacceso"
             return
          end
            
            # obteniendo las oepraciones para la accion o controlador 
            if controlador !="inicio"
                @operaciones=getOperaciones(idrol,controlador) 
                 puts "operaciones....=#{@operaciones}"    
            end
      
      end
  end
  