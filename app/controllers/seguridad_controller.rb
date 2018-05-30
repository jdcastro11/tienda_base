class SeguridadController < ApplicationController
  skip_before_action:verify_authenticity_token #desactiva el control de autencicidad del la solicitud
  require "pp"
  require 'securerandom'
  include Servicios 
  def login 
    render  layout: 'layout_simple'
  end
    
  def autenticar
    xpass=Encriptar(params[:password])
     xusuario=User.where(usuario:params[:usuario],password:xpass)
    pp(xusuario)
     if xusuario != []
       session[:id] = SecureRandom.hex  
       session[:usuario]=xusuario.map(&:usuario)[0]	    
       session[:idusuario]=xusuario.map(&:id)[0]
       session[:idrol]=xusuario.map(&:idrol)[0]	   
        if  session[:idrol]==28   # es un cliente
            redirect_to "/inicio"
        else 
            redirect_to "/admin"    #es un empleado de la tienda
        end
       else 
        flash.alert="Usuario y/o password incorrecto. Verifique"
        redirect_to "/login"  
      end
  end
 
  def logout
        reset_session
        session[:id] =""
         session[:usuario]=""
        session[:idusuario]=""
        session[:idrol]=""	  
         redirect_to "/productos"
  end
 
 end