require 'test_helper'

class FeedstockByProductsControllerTest < ActionController::TestCase
  setup do
    @feedstock_by_product = feedstock_by_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:feedstock_by_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create feedstock_by_product" do
    assert_difference('FeedstockByProduct.count') do
      post :create, feedstock_by_product: { quantity: @feedstock_by_product.quantity }
    end

    assert_redirected_to feedstock_by_product_path(assigns(:feedstock_by_product))
  end

  test "should show feedstock_by_product" do
    get :show, id: @feedstock_by_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @feedstock_by_product
    assert_response :success
  end

  test "should update feedstock_by_product" do
    put :update, id: @feedstock_by_product, feedstock_by_product: { quantity: @feedstock_by_product.quantity }
    assert_redirected_to feedstock_by_product_path(assigns(:feedstock_by_product))
  end

  test "should destroy feedstock_by_product" do
    assert_difference('FeedstockByProduct.count', -1) do
      delete :destroy, id: @feedstock_by_product
    end

    assert_redirected_to feedstock_by_products_path
  end
end
