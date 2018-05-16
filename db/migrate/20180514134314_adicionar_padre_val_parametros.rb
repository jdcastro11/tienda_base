class AdicionarPadreValParametros < ActiveRecord::Migration[5.1]
  def change
    add_column :valorparametros, :idpadre, :integer
  end
end
