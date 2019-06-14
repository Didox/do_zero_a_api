class CarrosController < ApplicationController
  before_action :set_carro, only: [:show, :edit, :update, :destroy]

  skip_before_action :verify_authenticity_token

  # GET /carros
  # GET /carros.json
  def index
    @carros = Carro.all
  end

  def proxy
    request = RestClient::Request.new(
      :method => :get,
      :url => "http://localhost:3001/token-acesso.json"
    ).execute

    token = JSON.parse(request.body)["token"]
    token = Base64.encode64(token)

    response = RestClient::Request.new(
      :method => :get,
      :url => "http://localhost:3001/carros.json",
      :headers => { "Authentic-Token" => token, :content_type => :json }
    ).execute

    render json: JSON.parse(response.body), status: 201
  end

  # GET /carros/1
  # GET /carros/1.json
  def show
    #render json: {mensagem:"teste"}, status: 204
  end

  # GET /carros/new
  def new
    @carro = Carro.new
  end

  # GET /carros/1/edit
  def edit
  end

  # POST /carros
  # POST /carros.json
  def create

    @carro = Carro.new(carro_params)

    respond_to do |format|
      if @carro.save
        format.html { redirect_to @carro, notice: 'Carro was successfully created.' }
        format.json { render json: {}, status: 201 }
      else
        format.html { render :new }
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carros/1
  # PATCH/PUT /carros/1.json
  def update
    respond_to do |format|
      if @carro.update(carro_params)
        format.html { redirect_to @carro, notice: 'Carro was successfully updated.' }
        format.json { render json: {}, status: 204 }
      else
        format.html { render :edit }
        format.json { render json: @carro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carros/1
  # DELETE /carros/1.json
  def destroy
    @carro.destroy
    respond_to do |format|
      format.html { redirect_to carros_url, notice: 'Carro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carro
      @carro = Carro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carro_params
      params.require(:carro).permit(:nome, :marca, :modelo, :ano)
    end
end
