class CreateRoleOptionOperations < ActiveRecord::Migration[5.1]
  def change
    create_table  :role_option_operations do |t|
      t.integer   :idrol                          # Es un parametro
      t.integer   :idoperacion                    # Es un parametro
      t.string    :estadorolop,limit:1, default:"A"
      t.boolean   :eliminado, default:false
      t.timestamps
    end
  end
end
