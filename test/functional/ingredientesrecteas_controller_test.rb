require 'test_helper'

class IngredientesrecteasControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingredientesrecteas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingredientesrectea" do
    assert_difference('Ingredientesrectea.count') do
      post :create, :ingredientesrectea => { }
    end

    assert_redirected_to ingredientesrectea_path(assigns(:ingredientesrectea))
  end

  test "should show ingredientesrectea" do
    get :show, :id => ingredientesrecteas(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ingredientesrecteas(:one).id
    assert_response :success
  end

  test "should update ingredientesrectea" do
    put :update, :id => ingredientesrecteas(:one).id, :ingredientesrectea => { }
    assert_redirected_to ingredientesrectea_path(assigns(:ingredientesrectea))
  end

  test "should destroy ingredientesrectea" do
    assert_difference('Ingredientesrectea.count', -1) do
      delete :destroy, :id => ingredientesrecteas(:one).id
    end

    assert_redirected_to ingredientesrecteas_path
  end
end
