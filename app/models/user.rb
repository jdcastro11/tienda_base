# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  usuario         :string(50)
#  password        :string(50)
#  identidad       :integer
#  idtipoentidad   :integer
#  idestadousuario :integer
#  idrol           :integer
#  eliminado       :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
include Servicios
class User < ApplicationRecord
    before_save :encriptarPass
    has_many :role_option_operations

    validates :usuario, presence: true, length: { minimum: 4 },
    uniqueness: { case_sensitive: false,message: "Usuario existe. Verifique" }
    validates :password, presence: {message: "Debe agregar un password valido." }
  private 
  def encriptarPass 
    if self.password !=nil           	
    	self.password = Encriptar(self.password)
    end    
   end    
end
