require 'test_helper'

class AllOrdersControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

end
