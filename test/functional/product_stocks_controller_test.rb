require 'test_helper'

class ProductStocksControllerTest < ActionController::TestCase
  setup do
    @product_stock = product_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_stock" do
    assert_difference('ProductStock.count') do
      post :create, product_stock: { quantity: @product_stock.quantity }
    end

    assert_redirected_to product_stock_path(assigns(:product_stock))
  end

  test "should show product_stock" do
    get :show, id: @product_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_stock
    assert_response :success
  end

  test "should update product_stock" do
    put :update, id: @product_stock, product_stock: { quantity: @product_stock.quantity }
    assert_redirected_to product_stock_path(assigns(:product_stock))
  end

  test "should destroy product_stock" do
    assert_difference('ProductStock.count', -1) do
      delete :destroy, id: @product_stock
    end

    assert_redirected_to product_stocks_path
  end
end
