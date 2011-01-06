require 'test_helper'

class SubideasControllerTest < ActionController::TestCase
  setup do
    @subidea = subideas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subideas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subidea" do
    assert_difference('Subidea.count') do
      post :create, :subidea => @subidea.attributes
    end

    assert_redirected_to subidea_path(assigns(:subidea))
  end

  test "should show subidea" do
    get :show, :id => @subidea.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @subidea.to_param
    assert_response :success
  end

  test "should update subidea" do
    put :update, :id => @subidea.to_param, :subidea => @subidea.attributes
    assert_redirected_to subidea_path(assigns(:subidea))
  end

  test "should destroy subidea" do
    assert_difference('Subidea.count', -1) do
      delete :destroy, :id => @subidea.to_param
    end

    assert_redirected_to subideas_path
  end
end
