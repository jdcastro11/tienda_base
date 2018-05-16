class BaseController < ApplicationController
    before_action :auth!
    require "pp"
    include Servicios
     #implementando Autenticación
     
     private  
     def auth!
          
         if session[:idrol]== ""     
             puts "No hay session"
             redirect_to "/login"
             return                         
         end
     
       # implementando  autorizacion
         
          puts "Si paso por qui hay Session"
      
         #verb=request.env["REQUEST_METHOD"]
         # accion=action_name      
        uri= request.original_url  
       
        idrol= session[:idrol]       
        
        uridiv = uri.split('/') 
        if uridiv.length() > 3  and idrol !=""
          controlador = uridiv[3].split("?").first.to_s  
          puts "controlador="
          pp(controlador)   
          acceso=validarAccesoOpcion(idrol,controlador)
           
          if !acceso 
             redirect_to "/noacceso"
             return
          end
            
            # obteniendo las oepraciones para la accion o controlador 
            if controlador !="inicio"
                @operaciones=getOperaciones(idrol,controlador) 
                 puts "operaciones=#{@operaciones}"    
          end
        end 
      end
  end
  