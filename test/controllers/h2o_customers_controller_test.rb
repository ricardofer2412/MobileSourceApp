require 'test_helper'

class H2oCustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @h2o_customer = h2o_customers(:one)
  end

  test "should get index" do
    get h2o_customers_url
    assert_response :success
  end

  test "should get new" do
    get new_h2o_customer_url
    assert_response :success
  end

  test "should create h2o_customer" do
    assert_difference('H2oCustomer.count') do
      post h2o_customers_url, params: { h2o_customer: { companyName: @h2o_customer.companyName } }
    end

    assert_redirected_to h2o_customer_url(H2oCustomer.last)
  end

  test "should show h2o_customer" do
    get h2o_customer_url(@h2o_customer)
    assert_response :success
  end

  test "should get edit" do
    get edit_h2o_customer_url(@h2o_customer)
    assert_response :success
  end

  test "should update h2o_customer" do
    patch h2o_customer_url(@h2o_customer), params: { h2o_customer: { companyName: @h2o_customer.companyName } }
    assert_redirected_to h2o_customer_url(@h2o_customer)
  end

  test "should destroy h2o_customer" do
    assert_difference('H2oCustomer.count', -1) do
      delete h2o_customer_url(@h2o_customer)
    end

    assert_redirected_to h2o_customers_url
  end
end
