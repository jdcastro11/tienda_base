# == Schema Information
#
# Table name: facturas
#
#  id              :bigint(8)        not null, primary key
#  numfact         :string(10)
#  fecha           :datetime
#  direntrega      :string(200)
#  idestadofactura :integer
#  idtipofactura   :integer
#  cliente_id      :bigint(8)
#  empleado_id     :bigint(8)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class FacturaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
