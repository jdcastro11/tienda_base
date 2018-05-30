json.extract! empleado, :id, :identificacion, :idtipoidentificacion, :nombres, :apellidos, :telefonos, :correo, :direccion, :idgenero, :idcargo, :idarea, :idestadoemp, :eliminado, :created_at, :updated_at
json.url empleado_url(empleado, format: :json)
