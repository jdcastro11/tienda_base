class CreateDetfacturas < ActiveRecord::Migration[5.1]
  def change
    create_table   :detfacturas do |t|
      t.integer    :cant
      t.decimal    :precio, precision:6, scale:2
      t.decimal    :iva, precision:4, scale:2
      t.integer    :idestadodetfactura  
      t.references :factura 
      t.references :producto
      t.boolean    :eliminado, default:false
      t.timestamps
    end
  end
end
