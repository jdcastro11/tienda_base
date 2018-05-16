class CreateFacturas < ActiveRecord::Migration[5.1]
  def change
    create_table   :facturas do |t|
      t.string     :numfact, limit:10
      t.datetime   :fecha
      t.string     :direntrega, limit:200
      t.integer    :idestadofactura
      t.integer    :idtipofactura     
      t.references :cliente, foreign_key:true
      t.references :empleado, foreign_key:true
      t.timestamps
    end
  end
end
