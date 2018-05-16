class CreateParametros < ActiveRecord::Migration[5.1]
  def change
    create_table :parametros do |t|
      t.string    :atributo, limit: 50
      t.string    :descripcion, limit: 300
      t.string    :estadoparametro, limit: 1,default:"A"
      t.boolean   :eliminado, default:false
      t.timestamps      
    end
  end
end
