class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  include Servicios
  require 'json'
  def index
    @users = User.all
    @usersExt= @users.map do |u|
      {
        "id"           =>u.id,
        "usuario"      =>u.usuario,
        "tipo"         =>TraerValorParametro(u.idtipoentidad),
        "nombre"        =>TraerUsuario(u.idtipoentidad,u.identidad),
        "rol"           =>TraerValorParametro(u.idrol),
        "estado"        =>TraerValorParametro(u.idestadousuario)
      }
    end
    render layout: "layout_admin"
  end
  def traer    
     @personas=TraerUsuarios(params[:id])  
      respond_to do |format|      
        format.json { render json:@personas.to_json}      
      end
  end
  # GET /users/1
  # GET /users/1.json
  def show
    render layout: "layout_admin"
  end

  # GET /users/new
  def new
    @user = User.new
    @tipos=TraerParametros(10)  
    @roles= TraerParametros(9)
    @estados=TraerParametros(8)
    @swope=0
    render layout: "layout_admin"
  end

  # GET /users/1/edit
  def edit
    @tipos=TraerParametros(10)  
    @roles= TraerParametros(9)
    @estados=TraerParametros(8)
    @swope=1
    render layout: "layout_admin"
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:usuario, :password, :identidad, :idtipoentidad, :idestadousuario, :idrol, :eliminado)
    end
end
