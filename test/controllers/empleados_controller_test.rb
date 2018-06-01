require 'test_helper'

class EmpleadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empleado = empleados(:one)
  end

  test "should get index" do
    get empleados_url
    assert_response :success
  end

  test "should get new" do
    get new_empleado_url
    assert_response :success
  end

  test "should create empleado" do
    assert_difference('Empleado.count') do
      post empleados_url, params: { empleado: { apellidos: @empleado.apellidos, correo: @empleado.correo, direccion: @empleado.direccion, eliminado: @empleado.eliminado, idarea: @empleado.idarea, idcargo: @empleado.idcargo, identificacion: @empleado.identificacion, idestadoemp: @empleado.idestadoemp, idgenero: @empleado.idgenero, idtipoidentificacion: @empleado.idtipoidentificacion, nombres: @empleado.nombres, telefonos: @empleado.telefonos } }
    end

    assert_redirected_to empleado_url(Empleado.last)
  end

  test "should show empleado" do
    get empleado_url(@empleado)
    assert_response :success
  end

  test "should get edit" do
    get edit_empleado_url(@empleado)
    assert_response :success
  end

  test "should update empleado" do
    patch empleado_url(@empleado), params: { empleado: { apellidos: @empleado.apellidos, correo: @empleado.correo, direccion: @empleado.direccion, eliminado: @empleado.eliminado, idarea: @empleado.idarea, idcargo: @empleado.idcargo, identificacion: @empleado.identificacion, idestadoemp: @empleado.idestadoemp, idgenero: @empleado.idgenero, idtipoidentificacion: @empleado.idtipoidentificacion, nombres: @empleado.nombres, telefonos: @empleado.telefonos } }
    assert_redirected_to empleado_url(@empleado)
  end

  test "should destroy empleado" do
    assert_difference('Empleado.count', -1) do
      delete empleado_url(@empleado)
    end

    assert_redirected_to empleados_url
  end
end
