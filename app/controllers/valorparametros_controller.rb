class ValorparametrosController < ApplicationController
  before_action :set_valorparametro, only: [:show, :edit, :update, :destroy]

  # GET /valorparametros
  # GET /valorparametros.json
  def index
    # @valorparametros = Valorparametro.all
    @valorparametros = Valorparametro.search(params[:term], params[:page]).where("parametro_id = ?",params[:id])
    @idp=params[:id]
    pp("idp=",@idp)
    render layout: "layout_simple", template: "valorparametros/listar"
  end

  # GET /valorparametros/1
  # GET /valorparametros/1.json
  def show
   
    render layout: "layout_simple"
    @swope=0
  end

  # GET /valorparametros/new
 
  def new
    @valorparametro = Valorparametro.new
    @idp=params[:id]
    @swope=0      
    render layout: "layout_simple"

  end

  # GET /valorparametros/1/edit
  def edit 
    @idp=params[:idp]
    @swope=1;
    render layout: "layout_simple"
   
  end

  # POST /valorparametros
  # POST /valorparametros.json
  def create
    @valorparametro = Valorparametro.new(valorparametro_params)

    respond_to do |format|
      if @valorparametro.save
        format.html { redirect_to @valorparametro, notice: 'Registro creado exitosamente.' }
        format.json { render :show, status: :created, location: @valorparametro }
      else
        format.html { render :new }
        format.json { render json: @valorparametro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /valorparametros/1
  # PATCH/PUT /valorparametros/1.json
  def update
   
    #respond_to do |format|
    if @valorparametro.update(valorparametro_params)
      #    pp("valorparams",valorparametro_params)
      #    format.html { redirect_to @valorparametro, notice: 'Registro fue actualizado exitosamente' }
      #    format.json { render :show, status: :ok, location: @valorparametro }
      #  else
      #    format.html { render :edit }
      #    format.json { render json: @valorparametro.errors, status: :unprocessable_entity }
      #  end
      #end
  
    redirect_to "/valp/#{valorparametro_params['parametro_id']}"
   end
  end

  # DELETE /valorparametros/1
  # DELETE /valorparametros/1.json
  def destroy
    @valorparametro.destroy
    respond_to do |format|
      format.html { redirect_to valorparametros_url, notice: 'Registro eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_valorparametro
      @valorparametro = Valorparametro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def valorparametro_params
      params.require(:valorparametro).permit(:valor, :estadovalorparametro, :orden, :eliminado, :idpadre, :parametro_id)
    end
end
