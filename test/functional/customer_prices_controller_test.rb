require 'test_helper'

class CustomerPricesControllerTest < ActionController::TestCase
  setup do
    @customer_price = customer_prices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_prices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_price" do
    assert_difference('CustomerPrice.count') do
      post :create, customer_price: { price: @customer_price.price }
    end

    assert_redirected_to customer_price_path(assigns(:customer_price))
  end

  test "should show customer_price" do
    get :show, id: @customer_price
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_price
    assert_response :success
  end

  test "should update customer_price" do
    put :update, id: @customer_price, customer_price: { price: @customer_price.price }
    assert_redirected_to customer_price_path(assigns(:customer_price))
  end

  test "should destroy customer_price" do
    assert_difference('CustomerPrice.count', -1) do
      delete :destroy, id: @customer_price
    end

    assert_redirected_to customer_prices_path
  end
end
