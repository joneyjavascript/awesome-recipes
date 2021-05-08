class CreateUsuarios < ActiveRecord::Migration[6.1]
  def change
    create_table :usuarios do |t|
      t.string :name
      t.string :email
      t.string :hash_senha
      t.boolean :active

      t.timestamps
    end
  end
end
