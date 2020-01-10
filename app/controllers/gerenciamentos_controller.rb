class GerenciamentosController < ApplicationController
  before_action :set_gerenciamento, only: [:show, :edit, :update, :destroy]

  # GET /gerenciamentos
  # GET /gerenciamentos.json
  def index
    @gerenciamentos = Gerenciamento.all
  end

  def versao
    render json: Gerenciamento.reorder("created_at desc").first, status: 200
  end

  # GET /gerenciamentos/1
  # GET /gerenciamentos/1.json
  def show
  end

  # GET /gerenciamentos/new
  def new
    @gerenciamento = Gerenciamento.new
  end

  # GET /gerenciamentos/1/edit
  def edit
  end

  # POST /gerenciamentos
  # POST /gerenciamentos.json
  def create
    @gerenciamento = Gerenciamento.new(gerenciamento_params)

    respond_to do |format|
      if @gerenciamento.save
        format.html { redirect_to @gerenciamento, notice: 'Gerenciamento was successfully created.' }
        format.json { render :show, status: :created, location: @gerenciamento }
      else
        format.html { render :new }
        format.json { render json: @gerenciamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gerenciamentos/1
  # PATCH/PUT /gerenciamentos/1.json
  def update
    respond_to do |format|
      if @gerenciamento.update(gerenciamento_params)
        format.html { redirect_to @gerenciamento, notice: 'Gerenciamento was successfully updated.' }
        format.json { render :show, status: :ok, location: @gerenciamento }
      else
        format.html { render :edit }
        format.json { render json: @gerenciamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gerenciamentos/1
  # DELETE /gerenciamentos/1.json
  def destroy
    @gerenciamento.destroy
    respond_to do |format|
      format.html { redirect_to gerenciamentos_url, notice: 'Gerenciamento was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gerenciamento
      @gerenciamento = Gerenciamento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gerenciamento_params
      params.require(:gerenciamento).permit(:nome, :versao, :descritivo)
    end
end
