require 'test_helper'

class MainPageControllerTest < ActionController::TestCase
  test "should get main" do
    get :topic
    assert_response :success
  end

end
