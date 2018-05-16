# == Schema Information
#
# Table name: parametros
#
#  id              :bigint(8)        not null, primary key
#  atributo        :string(50)
#  descripcion     :string(300)
#  estadoparametro :string(1)        default("A")
#  eliminado       :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class ParametroTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
