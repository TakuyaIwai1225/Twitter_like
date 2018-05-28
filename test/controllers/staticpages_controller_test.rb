require 'test_helper'

class StaticpagesControllerTest < ActionDispatch::IntegrationTest
  test "should get heme" do
    get staticpages_heme_url
    assert_response :success
  end

  test "should get help" do
    get staticpages_help_url
    assert_response :success
  end

end
