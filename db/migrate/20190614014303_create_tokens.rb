class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :valor
      t.datetime :data_inicial
      t.datetime :data_final

      t.timestamps
    end
  end
end
