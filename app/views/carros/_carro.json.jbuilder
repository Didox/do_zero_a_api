json.extract! carro, :id, :nome, :marca, :modelo, :ano, :created_at, :updated_at
json.url carro_url(carro, format: :json)
