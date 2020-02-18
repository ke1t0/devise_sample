require 'test_helper'

class RelationsipsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get relationsips_create_url
    assert_response :success
  end

  test "should get destroy" do
    get relationsips_destroy_url
    assert_response :success
  end

end
