require 'test_helper'

class ProductBasesControllerTest < ActionController::TestCase
  setup do
    @product_basis = product_bases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_bases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_basis" do
    assert_difference('ProductBase.count') do
      post :create, product_basis: { name: @product_basis.name, products: @product_basis.products, string: @product_basis.string }
    end

    assert_redirected_to product_basis_path(assigns(:product_basis))
  end

  test "should show product_basis" do
    get :show, id: @product_basis
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_basis
    assert_response :success
  end

  test "should update product_basis" do
    put :update, id: @product_basis, product_basis: { name: @product_basis.name, products: @product_basis.products, string: @product_basis.string }
    assert_redirected_to product_basis_path(assigns(:product_basis))
  end

  test "should destroy product_basis" do
    assert_difference('ProductBase.count', -1) do
      delete :destroy, id: @product_basis
    end

    assert_redirected_to product_bases_path
  end
end
