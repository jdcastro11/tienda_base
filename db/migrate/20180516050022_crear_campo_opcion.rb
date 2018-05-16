class CrearCampoOpcion < ActiveRecord::Migration[5.1]
  def change
    add_reference :role_option_operations, :options, foreign_key:true
   
  end
end
