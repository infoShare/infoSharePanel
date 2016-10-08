require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get sessions_login_url
    assert_response :success
  end

  test "should get home" do
    get sessions_home_url
    assert_response :success
  end

  test "should get logout" do
    get sessions_logout_url
    assert_response :success
  end

end
