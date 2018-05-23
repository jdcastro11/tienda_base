# == Schema Information
#
# Table name: role_option_operations
#
#  id          :bigint(8)        not null, primary key
#  idrol       :integer
#  idoperacion :integer
#  estadorolop :string(1)        default("A")
#  eliminado   :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  options_id  :bigint(8)
#

require 'test_helper'

class RoleOptionOperationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
