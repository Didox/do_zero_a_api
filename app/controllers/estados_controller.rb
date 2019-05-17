class EstadosController < ApplicationController
  def index

    estados = [
      {nome:"São Paulo",uf:"SP"},
      {nome:"Rio de Jneiro",uf:"RJ"},
      {nome:"Amazonas ",uf:"AM"},
      {nome:"Acre",uf:"AC"}
    ]

    render json: estados, status: 200
    
  end

end
