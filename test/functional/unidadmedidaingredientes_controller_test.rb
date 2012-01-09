require 'test_helper'

class UnidadmedidaingredientesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:unidadmedidaingredientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create unidadmedidaingrediente" do
    assert_difference('Unidadmedidaingrediente.count') do
      post :create, :unidadmedidaingrediente => { }
    end

    assert_redirected_to unidadmedidaingrediente_path(assigns(:unidadmedidaingrediente))
  end

  test "should show unidadmedidaingrediente" do
    get :show, :id => unidadmedidaingredientes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => unidadmedidaingredientes(:one).id
    assert_response :success
  end

  test "should update unidadmedidaingrediente" do
    put :update, :id => unidadmedidaingredientes(:one).id, :unidadmedidaingrediente => { }
    assert_redirected_to unidadmedidaingrediente_path(assigns(:unidadmedidaingrediente))
  end

  test "should destroy unidadmedidaingrediente" do
    assert_difference('Unidadmedidaingrediente.count', -1) do
      delete :destroy, :id => unidadmedidaingredientes(:one).id
    end

    assert_redirected_to unidadmedidaingredientes_path
  end
end
