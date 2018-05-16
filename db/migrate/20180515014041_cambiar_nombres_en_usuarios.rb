class CambiarNombresEnUsuarios < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :idusuario, :identidad
    rename_column :users, :idtipousuario, :idtipoentidad
  end
end
