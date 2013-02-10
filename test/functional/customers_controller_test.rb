require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { addres: @customer.addres, belongs_to: @customer.belongs_to, city: @customer.city, cpf_cnpj: @customer.cpf_cnpj, email: @customer.email, fax: @customer.fax, mobile: @customer.mobile, municipal_number: @customer.municipal_number, name: @customer.name, observations: @customer.observations, phone1: @customer.phone1, phone2: @customer.phone2, state: @customer.state, suframa: @customer.suframa, tribute: @customer.tribute }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    put :update, id: @customer, customer: { addres: @customer.addres, belongs_to: @customer.belongs_to, city: @customer.city, cpf_cnpj: @customer.cpf_cnpj, email: @customer.email, fax: @customer.fax, mobile: @customer.mobile, municipal_number: @customer.municipal_number, name: @customer.name, observations: @customer.observations, phone1: @customer.phone1, phone2: @customer.phone2, state: @customer.state, suframa: @customer.suframa, tribute: @customer.tribute }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
