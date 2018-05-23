# == Schema Information
#
# Table name: productos
#
#  id                  :bigint(8)        not null, primary key
#  nombre              :string(100)
#  descripcion         :string(300)
#  ref                 :string(50)
#  precio              :decimal(15, 2)
#  idtipoproducto      :integer
#  idcategoriaproducto :integer
#  idestadoproducto    :integer
#  stock               :integer          default(0)
#  imagen              :string(100)
#  eliminado           :boolean          default(FALSE)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class ProductoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
