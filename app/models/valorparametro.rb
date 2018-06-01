# == Schema Information
#
# Table name: valorparametros
#
#  id                   :bigint(8)        not null, primary key
#  valor                :string(300)
#  estadovalorparametro :string(1)        default("A")
#  orden                :string(4)
#  eliminado            :boolean          default(FALSE)
#  parametro_id         :bigint(8)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  idpadre              :integer
#

class Valorparametro < ApplicationRecord
    belongs_to   :parametro

    def self.search(term, page)
        if term
          where('nombre LIKE ?', "%#{term}%").paginate(page: page, per_page: 10).order('id DESC')
        else
          paginate(page: page, per_page: 10).order('id DESC') 
        end
    end
end
