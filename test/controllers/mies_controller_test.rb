require "test_helper"

class MiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get mies_show_url
    assert_response :success
  end
end
