class CreateProductos < ActiveRecord::Migration[5.1]
  def change
    create_table :productos do |t|
     t.string    :nombre,limit:100
     t.string    :descipcion, limit:300
     t.string    :ref, limit:50
     t.decimal   :precio, precision:6, scale:2     
     t.integer   :idtipoproducto 
     t.integer   :idcategoriaproducto
     t.integer   :idestadoproducto
     t.integer   :stock,default:0
     t.string    :imagen, limit:100
     t.boolean   :eliminado, default:false
     t.timestamps
    end
  end
end
