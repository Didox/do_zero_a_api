class CreateAcessosApis < ActiveRecord::Migration[5.2]
  def change
    create_table :acessos_apis do |t|
      t.string :token
      t.string :url

      t.timestamps
    end
  end
end
