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
    validates :nombres, presence: true, length:{minimum: 4}
    validates :apellidos, presence: true, length:{minimum: 4}
    validates :razonSocial, presence: true, length:{minimum: 4}
    validates :correo, presence: true, length:{minimum: 4}
    validates :direccion, presence: true, length:{minimum: 4}
    validates :telefonos, presence: true, length:{minimum: 4}
    validates :identificacion, presence: true, length: {minimum:5},
    uniqueness: {case_sensitive: false, messgae: "Cliente ya existe"}
    def nombrecompleto 
        "#{try(:nombres)} #{try(:apellidos)}".to_s
    end
end
