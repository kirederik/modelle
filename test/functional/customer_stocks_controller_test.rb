require 'test_helper'

class CustomerStocksControllerTest < ActionController::TestCase
  setup do
    @customer_stock = customer_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_stock" do
    assert_difference('CustomerStock.count') do
      post :create, customer_stock: { quantity: @customer_stock.quantity }
    end

    assert_redirected_to customer_stock_path(assigns(:customer_stock))
  end

  test "should show customer_stock" do
    get :show, id: @customer_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_stock
    assert_response :success
  end

  test "should update customer_stock" do
    put :update, id: @customer_stock, customer_stock: { quantity: @customer_stock.quantity }
    assert_redirected_to customer_stock_path(assigns(:customer_stock))
  end

  test "should destroy customer_stock" do
    assert_difference('CustomerStock.count', -1) do
      delete :destroy, id: @customer_stock
    end

    assert_redirected_to customer_stocks_path
  end
end
