class CreateClientes < ActiveRecord::Migration[5.1]
  def change
    create_table :clientes do |t|
      t.string   :nombres, limit: 100     
      t.string   :apellidos, limit: 100
      t.string   :identificacion, limit: 50
      t.integer  :idtipoidentificacion
      t.string   :razonSocial,limit:200
      t.string   :correo, limit: 100
      t.string   :direccion, limit: 100
      t.string   :telefonos
      t.integer  :idtipocliente
      t.integer  :idcategoriacliente
      t.integer  :idestado
      t.integer  :idgenero
      t.boolean  :eliminado, default:false
      t.timestamps
    end
  end
end
