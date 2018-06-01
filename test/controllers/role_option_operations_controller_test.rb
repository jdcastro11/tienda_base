require 'test_helper'

class RoleOptionOperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @role_option_operation = role_option_operations(:one)
  end

  test "should get index" do
    get role_option_operations_url
    assert_response :success
  end

  test "should get new" do
    get new_role_option_operation_url
    assert_response :success
  end

  test "should create role_option_operation" do
    assert_difference('RoleOptionOperation.count') do
      post role_option_operations_url, params: { role_option_operation: { eliminado: @role_option_operation.eliminado, estadorolop: @role_option_operation.estadorolop, idoperacion: @role_option_operation.idoperacion, idrol: @role_option_operation.idrol } }
    end

    assert_redirected_to role_option_operation_url(RoleOptionOperation.last)
  end

  test "should show role_option_operation" do
    get role_option_operation_url(@role_option_operation)
    assert_response :success
  end

  test "should get edit" do
    get edit_role_option_operation_url(@role_option_operation)
    assert_response :success
  end

  test "should update role_option_operation" do
    patch role_option_operation_url(@role_option_operation), params: { role_option_operation: { eliminado: @role_option_operation.eliminado, estadorolop: @role_option_operation.estadorolop, idoperacion: @role_option_operation.idoperacion, idrol: @role_option_operation.idrol } }
    assert_redirected_to role_option_operation_url(@role_option_operation)
  end

  test "should destroy role_option_operation" do
    assert_difference('RoleOptionOperation.count', -1) do
      delete role_option_operation_url(@role_option_operation)
    end

    assert_redirected_to role_option_operations_url
  end
end
