class EstadosController < ApplicationController
  def index
    realeaseCrosDomain
    estados = [
      {nome:"São Paulo",uf:"SP"},
      {nome:"Rio de Jneiro",uf:"RJ"},
      {nome:"Amazonas ",uf:"AM"},
      {nome:"Acre",uf:"AC"}
    ]

    if params["uf"].present?
      estados = estados.select{|e| e[:uf].downcase == params["uf"].downcase }
    end

    render json: estados, status: 200
  end

  def proxy
    require 'rest-client'
    estados = RestClient.get("http://localhost:3000/estados.json")
    render json: estados.body, status: 200
  end

  def lista_cidades
    realeaseCrosDomain

    cidades = [
      {nome:"São Paulo",uf:"SP"},
      {nome:"São Bernardo do campo",uf:"SP"},
      {nome:"Mauá",uf:"SP"},
      {nome:"Campinas",uf:"SP"},
      {nome:"Niteroi",uf:"RJ"},
      {nome:"Cabo frio",uf:"RJ"},
      {nome:"Copacabana",uf:"RJ"},
    ]

    if params["uf"].present?
      cidades = cidades.select{|e| e[:uf].downcase == params["uf"].downcase }
    end
    
    render json: cidades, status: 200
  end

  private
  def realeaseCrosDomain
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
  end

end
