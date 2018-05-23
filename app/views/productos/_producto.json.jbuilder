json.extract! producto, :id, :nombre, :descipcion, :ref, :precio, :idtipoproducto, :idcategoriaproducto, :idestadoproducto, :stock, :imagen, :eliminado, :created_at, :updated_at
json.url producto_url(producto, format: :json)
