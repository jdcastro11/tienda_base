class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string   :usuario, limit:50
      t.string   :password,limit:50
      t.integer  :idusuario
      t.integer  :idtipousuario
      t.integer  :idestadousuario
      t.integer  :idrol                # Es un parametro
      t.boolean  :eliminado, default:false
      t.timestamps
    end
  end
end
