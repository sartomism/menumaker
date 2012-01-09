require 'test_helper'

class EtiquetasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:etiquetas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create etiqueta" do
    assert_difference('Etiqueta.count') do
      post :create, :etiqueta => { }
    end

    assert_redirected_to etiqueta_path(assigns(:etiqueta))
  end

  test "should show etiqueta" do
    get :show, :id => etiquetas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => etiquetas(:one).id
    assert_response :success
  end

  test "should update etiqueta" do
    put :update, :id => etiquetas(:one).id, :etiqueta => { }
    assert_redirected_to etiqueta_path(assigns(:etiqueta))
  end

  test "should destroy etiqueta" do
    assert_difference('Etiqueta.count', -1) do
      delete :destroy, :id => etiquetas(:one).id
    end

    assert_redirected_to etiquetas_path
  end
end
