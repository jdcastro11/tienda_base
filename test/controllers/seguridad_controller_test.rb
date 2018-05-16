require 'test_helper'

class SeguridadControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get seguridad_login_url
    assert_response :success
  end

end
