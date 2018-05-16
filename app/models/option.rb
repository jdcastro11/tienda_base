# == Schema Information
#
# Table name: options
#
#  id           :bigint(8)        not null, primary key
#  idpadre      :integer
#  opcion       :string(100)
#  url          :string(200)
#  estadoopcion :string(1)        default("A")
#  orden        :string(5)
#  eshoja       :boolean
#  controller   :string(100)
#  eliminado    :boolean          default(FALSE)
#

class Option < ApplicationRecord
    has_many :role_option_operations
end
