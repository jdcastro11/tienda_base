class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]

  # GET /clientes
  # GET /clientes.json
  include Servicios
  require 'json'
  def index
    @clientes = Cliente.all
    @clientesExt= @clientes.map do |c|
      {
        "id"   =>c.id,
        "nombres"   =>c.nombres,
        "apellidos"   =>c.apellidos,
        "identificacion"   =>c.identificacion,
        "Tipo_ID"   =>TraerValorParametro(c.idtipoidentificacion),
        "razonSocial"   =>c.razonSocial,
        "correo"   =>c.correo,
        "direccion"   =>c.direccion,
        "telefonos"   =>c.telefonos,
        "Tipo_Cliente"   =>TraerValorParametro(c.idtipocliente),
        "Categoria_Cliente"   =>TraerValorParametro(c.idcategoriacliente)
      }
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
    
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    @tipoId = TraerParametros(4)
    @tipoCliente = TraerParametros(5)
    @catcliente = TraerParametros(12)
    @idGenero = TraerParametros(11)
  end

  # GET /clientes/1/edit
  def edit
    @tipoId = TraerParametros(4)
    @tipoCliente = TraerParametros(5)
    @catcliente = TraerParametros(12)
    @idGenero = TraerParametros(11)
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:nombres, :apellidos, :identificacion, :idtipoidentificacion, :razonSocial, :correo, :direccion, :telefonos, :idtipocliente, :idcategoriacliente, :idestado, :idgenero, :eliminado)
    end
end
