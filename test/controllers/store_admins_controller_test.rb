require 'test_helper'

class StoreAdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_admins_index_url
    assert_response :success
  end

end
