class CreateEmpleados < ActiveRecord::Migration[5.1]
  def change
    create_table :empleados do |t|
      t.string   :identificacion, limit:50
      t.integer  :idtipoidentificacion
      t.string   :nombres, limit:100
      t.string   :apellidos, limit:100
      t.string   :telefonos
      t.string   :correo, limit: 100
      t.string   :direccion, limit:100
      t.integer  :idgenero
      t.integer  :idcargo
      t.integer  :idarea
      t.integer  :idestadoemp
      t.boolean  :eliminado, default:false
      t.timestamps
    end
  end
end
