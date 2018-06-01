# Se implenta la capa de servicios como un modulo, que implica el concepto de mixin,  
# los metodos que incluyan este archivo, puden usuar todos los metodos sin herencia 
module Servicios
    require 'digest/md5'
    require 'pp'
    def TraerValorParametro(params)	    
           unless params.nil?
             Valorparametro.find(params).valor
           end  
         
    end 
 
    def TraerParametros(params)
            unless params.nil?
              Valorparametro.where(["parametro_id ='#{params}'"]).select(:valor,:id) 
         end 
    end   
 
    def Encriptar(params)
        unless params.nil?       
           res = Digest::MD5.hexdigest(params)
           return res  
        end 
     end
     
     def TraerOpcion(params)
         unless params.nil?
           Option.find(params).opcion
         end 
     end

    def TraerOpciones()
          return Option.select(:id,:opcion).where(estadoopcion:"A") 
    end
     
     def validarAccesoOpcion(idrol,controlador)     
        puts "controlador en validar=#{controlador}"
       excepciones = ['noacceso','inicio','login','logout','valp']
     
       if excepciones.include?(controlador)
          puts  "Entre a las excepciones"
           return true
 
       else    
         
        res=RoleOptionOperation.select('op.controller')
                .joins('INNER JOIN options as op ON  role_option_operations.options_id = op.id')
                .where("role_option_operations.idrol=#{idrol} 
                       and op.controller ='#{controlador}'
                       and role_option_operations.estadorolop='A' 
                       and op.estadoopcion='A'
                       and role_option_operations.idoperacion=42
                       and op.eshoja=?",true)                              
           pp("res=====",res)
           resul=res.map(&:controller)
           if resul.empty?
             return false 
           else
             return true
          end
      end
   end
    
 
   def getOperaciones(idRol,controlador)
      
         resul=RoleOptionOperation.select("distinct idoperacion")
             .joins("INNER JOIN options as op ON role_option_operations.options_id = op.id")
             .where("role_option_operations.idrol = #{idRol} and
             role_option_operations.estadorolop = 'A' and op.estadoopcion = 'A' and op.eshoja =?  and
         op.controller = '#{controlador}'",true)
         
         operaciones_id=resul.map(&:idoperacion)
         operaciones= operaciones_id.map{|op| TraerValorParametro(op)}
         return operaciones
    
   end  
   
   def TraerUsuarios(idtipo)
      if idtipo=='35'       #es cliente
        res1=Cliente.where("idestado=29")   
         res= res1.map do |r| {
               "id"          => r.id,
               "nombre"      => r.nombrecompleto
            }
          end
      else 
        res1=Empleado.where("idestadoemp=50")   
        res= res1.map do |r| {
              "id"           => r.id,
              "nombre"      =>r.nombrecompleto
           }
         end
      end
   end

   def TraerUsuario(idtipo,id)

    if idtipo==35       #es cliente
      res=Cliente.where("idestado=29 and id=#{id}")          
    else 
      res=Empleado.where("idestadoemp=50 and id=#{id}")     
    end
    return  res[0].nombrecompleto
   end

   def getControlador(uri)
         uridiv = uri.split('/')
         if uridiv.length() > 3
           res=uridiv[3].split("?").first.to_s
         else
          res='productos'
         end
   end
 end