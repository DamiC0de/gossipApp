require "test_helper"

class WelcomesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get welcomes_show_url
    assert_response :success
  end
end
