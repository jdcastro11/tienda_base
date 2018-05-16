class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.integer  :idpadre
      t.string   :opcion, limit:100
      t.string   :url, limit:200
      t.string   :estadoopcion, limit:1, default:"A"
      t.string   :orden, limit:5
      t.boolean  :eshoja
      t.string   :controller, limit:100
      t.boolean  :eliminado, default:false
    end
  end
end
