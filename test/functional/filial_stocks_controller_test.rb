require 'test_helper'

class FilialStocksControllerTest < ActionController::TestCase
  setup do
    @filial_stock = filial_stocks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filial_stocks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filial_stock" do
    assert_difference('FilialStock.count') do
      post :create, filial_stock: { quantity: @filial_stock.quantity }
    end

    assert_redirected_to filial_stock_path(assigns(:filial_stock))
  end

  test "should show filial_stock" do
    get :show, id: @filial_stock
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filial_stock
    assert_response :success
  end

  test "should update filial_stock" do
    put :update, id: @filial_stock, filial_stock: { quantity: @filial_stock.quantity }
    assert_redirected_to filial_stock_path(assigns(:filial_stock))
  end

  test "should destroy filial_stock" do
    assert_difference('FilialStock.count', -1) do
      delete :destroy, id: @filial_stock
    end

    assert_redirected_to filial_stocks_path
  end
end
