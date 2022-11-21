require "test_helper"

class AstroflatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get astroflats_index_url
    assert_response :success
  end
end
