# == Schema Information
#
# Table name: clientes
#
#  id                   :bigint(8)        not null, primary key
#  nombres              :string(100)
#  apellidos            :string(100)
#  identificacion       :string(50)
#  idtipoidentificacion :integer
#  razonSocial          :string(200)
#  correo               :string(100)
#  direccion            :string(100)
#  telefonos            :string(255)
#  idtipocliente        :integer
#  idcategoriacliente   :integer
#  idestado             :integer
#  idgenero             :integer
#  eliminado            :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Cliente < ApplicationRecord
    has_many :facturas
    
    def nombrecompleto 
        "#{try(:nombres)} #{try(:apellidos)}".to_s
    end
end
