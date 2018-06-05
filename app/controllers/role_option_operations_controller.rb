class RoleOptionOperationsController < ApplicationController
  before_action :set_role_option_operation, only: [:show, :edit, :update, :destroy]
  
  # GET /role_option_operations
  # GET /role_option_operations.json
  include Servicios
  def index
    @role_option_operations = RoleOptionOperation.all
    @permisos= @role_option_operations.map do |r|
      {
        "id"           => r.id,
        "rol"          => TraerValorParametro(r.idrol),
        "opcion"       => TraerOpcion(r.options_id),
        "operacion"    => TraerValorParametro(r.idoperacion),
        "estado"       => r.estadorolop
      }
    end
    render layout: "layout_admin"
  end

  # GET /role_option_operations/1
  # GET /role_option_operations/1.json
  def show
    render layout: "layout_admin"
  end

  # GET /role_option_operations/new
  def new
    @role_option_operation = RoleOptionOperation.new
    setCombos
    @swope=0
    render layout: "layout_admin"
  end

  # GET /role_option_operations/1/edit
  def edit   
    setCombos
    @swope=1
      render layout: "layout_admin"
  end

  # POST /role_option_operations
  # POST /role_option_operations.json
  def create
    setCombos
    @role_option_operation = RoleOptionOperation.new(role_option_operation_params)
     respond_to do |format|
      pp("parametros===",role_option_operation_params)
      if @role_option_operation.save
        format.html { redirect_to @role_option_operation, notice: 'Role option operation was successfully created.' }
        format.json { render :show, status: :created, location: @role_option_operation }
      else
        format.html { render :new }
        format.json { render json: @role_option_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_option_operations/1
  # PATCH/PUT /role_option_operations/1.json
  def update
    setCombos
    respond_to do |format|
      if @role_option_operation.update(role_option_operation_params)
        pp("parametros===",role_option_operation_params)
        format.html { redirect_to @role_option_operation, notice: 'Role option operation was successfully updated.' }
        format.json { render :show, status: :ok, location: @role_option_operation }
      else
        format.html { render :edit }
        format.json { render json: @role_option_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_option_operations/1
  # DELETE /role_option_operations/1.json
  def destroy
    @role_option_operation.destroy
    respond_to do |format|
      format.html { redirect_to role_option_operations_url, notice: 'Role option operation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_option_operation
      @role_option_operation = RoleOptionOperation.find(params[:id])
    end
   
    private 
   def setCombos()
    @roles= TraerParametros(9)
    @opciones=TraerOpciones()
    pp("opciones====",@opciones)
    @operaciones= TraerParametros(13)
   end
   
   # Never trust parameters from the scary internet, only allow the white list through.
    def role_option_operation_params
      params.require(:role_option_operation).permit(:options_id, :idrol, :idoperacion, :estadorolop, :eliminado)
    end
end
