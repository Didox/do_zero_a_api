class CreateGerenciamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :gerenciamentos do |t|
      t.string :nome
      t.string :versao
      t.text :descritivo

      t.timestamps
    end
  end
end
