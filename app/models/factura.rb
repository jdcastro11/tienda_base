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

class Factura < ApplicationRecord
    has_many  :detfacturas
    belong_to :cliente
    belong_to :empleado
end
