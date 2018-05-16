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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
