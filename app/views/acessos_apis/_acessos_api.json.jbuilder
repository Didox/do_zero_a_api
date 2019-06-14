json.extract! acessos_api, :id, :token, :url, :created_at, :updated_at
json.url acessos_api_url(acessos_api, format: :json)
