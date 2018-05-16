# == Schema Information
#
# Table name: detfacturas
#
#  id                 :bigint(8)        not null, primary key
#  cant               :integer
#  precio             :decimal(6, 2)
#  iva                :decimal(4, 2)
#  idestadodetfactura :integer
#  factura_id         :bigint(8)
#  producto_id        :bigint(8)
#  eliminado          :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class DetfacturaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
