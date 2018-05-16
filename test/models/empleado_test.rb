# == Schema Information
#
# Table name: empleados
#
#  id                   :bigint(8)        not null, primary key
#  identificacion       :string(50)
#  idtipoidentificacion :integer
#  nombres              :string(100)
#  apellidos            :string(100)
#  telefonos            :string(255)
#  correo               :string(100)
#  direccion            :string(100)
#  idgenero             :integer
#  idcargo              :integer
#  idarea               :integer
#  idestadoemp          :integer
#  eliminado            :boolean          default(FALSE)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class EmpleadoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
