require 'test_helper'

class EtiquetaingredientesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:etiquetaingredientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create etiquetaingrediente" do
    assert_difference('Etiquetaingrediente.count') do
      post :create, :etiquetaingrediente => { }
    end

    assert_redirected_to etiquetaingrediente_path(assigns(:etiquetaingrediente))
  end

  test "should show etiquetaingrediente" do
    get :show, :id => etiquetaingredientes(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => etiquetaingredientes(:one).id
    assert_response :success
  end

  test "should update etiquetaingrediente" do
    put :update, :id => etiquetaingredientes(:one).id, :etiquetaingrediente => { }
    assert_redirected_to etiquetaingrediente_path(assigns(:etiquetaingrediente))
  end

  test "should destroy etiquetaingrediente" do
    assert_difference('Etiquetaingrediente.count', -1) do
      delete :destroy, :id => etiquetaingredientes(:one).id
    end

    assert_redirected_to etiquetaingredientes_path
  end
end
