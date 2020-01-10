class ApplicationController < ActionController::Base
  before_action :valida_token_api

  def valida_token_api
    return
    
    if request.path_parameters[:format] == 'json'
      if params[:controller] == "carros" && params[:action] == "proxy" || params[:controller] == "tokens" && params[:action] == "token_acesso"
        return
      end

      token = request.headers["Authentic-Token"]

      if token.blank?
        render json: {mensagem: "Token inválido ou vazio"}, status: 401
        return
      end

      token = Base64.decode64(token)
      tokens = Token.where(valor: token).where("data_inicial <= ? and data_final >= ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
      if tokens.count == 0
        render json: {mensagem: "Token inválido ou vazio"}, status: 401
      else
        AcessosApi.create(token: token, url: request.original_url)
        tokens.destroy_all
      end
    end
  end
end
