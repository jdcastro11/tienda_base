json.extract! cliente, :id, :nombres, :apellidos, :identificacion, :idtipoidentificacion, :razonSocial, :correo, :direccion, :telefonos, :idtipocliente, :idcategoriacliente, :idestado, :idgenero, :eliminado, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
