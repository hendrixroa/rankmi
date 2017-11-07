require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get departments_index_url
    assert_response :success
  end

  test "should get update" do
    put departments_update_url
    assert_response :success
  end

  test "should get create" do
    post departments_create_url
    assert_response :success
  end

end
