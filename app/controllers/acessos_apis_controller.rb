class AcessosApisController < ApplicationController
  before_action :set_acessos_api, only: [:show, :edit, :update, :destroy]

  # GET /acessos_apis
  # GET /acessos_apis.json
  def index
    @acessos_apis = AcessosApi.all
  end

  # GET /acessos_apis/1
  # GET /acessos_apis/1.json
  def show
  end

  # GET /acessos_apis/new
  def new
    @acessos_api = AcessosApi.new
  end

  # GET /acessos_apis/1/edit
  def edit
  end

  # POST /acessos_apis
  # POST /acessos_apis.json
  def create
    @acessos_api = AcessosApi.new(acessos_api_params)

    respond_to do |format|
      if @acessos_api.save
        format.html { redirect_to @acessos_api, notice: 'Acessos api was successfully created.' }
        format.json { render :show, status: :created, location: @acessos_api }
      else
        format.html { render :new }
        format.json { render json: @acessos_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acessos_apis/1
  # PATCH/PUT /acessos_apis/1.json
  def update
    respond_to do |format|
      if @acessos_api.update(acessos_api_params)
        format.html { redirect_to @acessos_api, notice: 'Acessos api was successfully updated.' }
        format.json { render :show, status: :ok, location: @acessos_api }
      else
        format.html { render :edit }
        format.json { render json: @acessos_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acessos_apis/1
  # DELETE /acessos_apis/1.json
  def destroy
    @acessos_api.destroy
    respond_to do |format|
      format.html { redirect_to acessos_apis_url, notice: 'Acessos api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acessos_api
      @acessos_api = AcessosApi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acessos_api_params
      params.require(:acessos_api).permit(:token, :url)
    end
end
