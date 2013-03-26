require 'test_helper'

class FeedstockStocksControllerTest < ActionController::TestCase
  setup do
    @feedstock_stock = feedstock_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedstock_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedstock_stock" do
    assert_difference('FeedstockStock.count') do
      post :create, feedstock_stock: { quantity: @feedstock_stock.quantity }
    end

    assert_redirected_to feedstock_stock_path(assigns(:feedstock_stock))
  end

  test "should show feedstock_stock" do
    get :show, id: @feedstock_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedstock_stock
    assert_response :success
  end

  test "should update feedstock_stock" do
    put :update, id: @feedstock_stock, feedstock_stock: { quantity: @feedstock_stock.quantity }
    assert_redirected_to feedstock_stock_path(assigns(:feedstock_stock))
  end

  test "should destroy feedstock_stock" do
    assert_difference('FeedstockStock.count', -1) do
      delete :destroy, id: @feedstock_stock
    end

    assert_redirected_to feedstock_stocks_path
  end
end
