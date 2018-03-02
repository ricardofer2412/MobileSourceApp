require 'test_helper'

class H2oReUpsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @h2o_re_up = h2o_re_ups(:one)
  end

  test "should get index" do
    get h2o_re_ups_url
    assert_response :success
  end

  test "should get new" do
    get new_h2o_re_up_url
    assert_response :success
  end

  test "should create h2o_re_up" do
    assert_difference('H2oReUp.count') do
      post h2o_re_ups_url, params: { h2o_re_up: { companyName: @h2o_re_up.companyName, expirationDate: @h2o_re_up.expirationDate, phoneNumber: @h2o_re_up.phoneNumber, pinNumber: @h2o_re_up.pinNumber, reupDate: @h2o_re_up.reupDate, simCard: @h2o_re_up.simCard } }
    end

    assert_redirected_to h2o_re_up_url(H2oReUp.last)
  end

  test "should show h2o_re_up" do
    get h2o_re_up_url(@h2o_re_up)
    assert_response :success
  end

  test "should get edit" do
    get edit_h2o_re_up_url(@h2o_re_up)
    assert_response :success
  end

  test "should update h2o_re_up" do
    patch h2o_re_up_url(@h2o_re_up), params: { h2o_re_up: { companyName: @h2o_re_up.companyName, expirationDate: @h2o_re_up.expirationDate, phoneNumber: @h2o_re_up.phoneNumber, pinNumber: @h2o_re_up.pinNumber, reupDate: @h2o_re_up.reupDate, simCard: @h2o_re_up.simCard } }
    assert_redirected_to h2o_re_up_url(@h2o_re_up)
  end

  test "should destroy h2o_re_up" do
    assert_difference('H2oReUp.count', -1) do
      delete h2o_re_up_url(@h2o_re_up)
    end

    assert_redirected_to h2o_re_ups_url
  end
end
