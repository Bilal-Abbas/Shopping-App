require 'test_helper'

class SellingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sellings_index_url
    assert_response :success
  end

  test "should get trade" do
    get sellings_trade_url
    assert_response :success
  end

  test "should get delete" do
    get sellings_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get sellings_destroy_url
    assert_response :success
  end

end
