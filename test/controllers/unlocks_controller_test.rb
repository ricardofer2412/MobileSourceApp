require 'test_helper'

class UnlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unlock = unlocks(:one)
  end

  test "should get index" do
    get unlocks_url
    assert_response :success
  end

  test "should get new" do
    get new_unlock_url
    assert_response :success
  end

  test "should create unlock" do
    assert_difference('Unlock.count') do
      post unlocks_url, params: { unlock: { date_submitted: @unlock.date_submitted, imei: @unlock.imei, request_number: @unlock.request_number, status: @unlock.status } }
    end

    assert_redirected_to unlock_url(Unlock.last)
  end

  test "should show unlock" do
    get unlock_url(@unlock)
    assert_response :success
  end

  test "should get edit" do
    get edit_unlock_url(@unlock)
    assert_response :success
  end

  test "should update unlock" do
    patch unlock_url(@unlock), params: { unlock: { date_submitted: @unlock.date_submitted, imei: @unlock.imei, request_number: @unlock.request_number, status: @unlock.status } }
    assert_redirected_to unlock_url(@unlock)
  end

  test "should destroy unlock" do
    assert_difference('Unlock.count', -1) do
      delete unlock_url(@unlock)
    end

    assert_redirected_to unlocks_url
  end
end
