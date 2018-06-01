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

class Parametro < ApplicationRecord
    has_many :valorparametros
    

    def self.search(term, page)
        if term
          where('nombre LIKE ?', "%#{term}%").paginate(page: page, per_page: 10).order('id DESC')
        else
          paginate(page: page, per_page: 10).order('id DESC') 
        end
    end
    
end
