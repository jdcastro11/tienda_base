require 'test_helper'

class ValorparametrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @valorparametro = valorparametros(:one)
  end

  test "should get index" do
    get valorparametros_url
    assert_response :success
  end

  test "should get new" do
    get new_valorparametro_url
    assert_response :success
  end

  test "should create valorparametro" do
    assert_difference('Valorparametro.count') do
      post valorparametros_url, params: { valorparametro: { eliminado: @valorparametro.eliminado, estadovalorparametro: @valorparametro.estadovalorparametro, idpadre: @valorparametro.idpadre, orden: @valorparametro.orden, valor: @valorparametro.valor } }
    end

    assert_redirected_to valorparametro_url(Valorparametro.last)
  end

  test "should show valorparametro" do
    get valorparametro_url(@valorparametro)
    assert_response :success
  end

  test "should get edit" do
    get edit_valorparametro_url(@valorparametro)
    assert_response :success
  end

  test "should update valorparametro" do
    patch valorparametro_url(@valorparametro), params: { valorparametro: { eliminado: @valorparametro.eliminado, estadovalorparametro: @valorparametro.estadovalorparametro, idpadre: @valorparametro.idpadre, orden: @valorparametro.orden, valor: @valorparametro.valor } }
    assert_redirected_to valorparametro_url(@valorparametro)
  end

  test "should destroy valorparametro" do
    assert_difference('Valorparametro.count', -1) do
      delete valorparametro_url(@valorparametro)
    end

    assert_redirected_to valorparametros_url
  end
end
