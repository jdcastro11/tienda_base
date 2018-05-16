class CreateValorparametros < ActiveRecord::Migration[5.1]
  def change
    create_table    :valorparametros do |t|
      t.string      :valor, limit:300
      t.string      :estadovalorparametro, limit:1,default:"A"
      t.string      :orden, limit: 4    
      t.boolean     :eliminado, default:false
      t.references  :parametro,foreign_key:true
      t.timestamps
    end
  end
end
