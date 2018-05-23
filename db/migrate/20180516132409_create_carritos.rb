class CreateCarritos < ActiveRecord::Migration[5.1]
  def change
    create_table :carritos do |t|

      t.timestamps
    end
  end
end
