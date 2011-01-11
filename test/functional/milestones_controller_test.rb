require 'test_helper'

class MilestonesControllerTest < ActionController::TestCase
  setup do
    @milestone = milestones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:milestones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create milestone" do
    assert_difference('Milestone.count') do
      post :create, :milestone => @milestone.attributes
    end

    assert_redirected_to milestone_path(assigns(:milestone))
  end

  test "should show milestone" do
    get :show, :id => @milestone.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @milestone.to_param
    assert_response :success
  end

  test "should update milestone" do
    put :update, :id => @milestone.to_param, :milestone => @milestone.attributes
    assert_redirected_to milestone_path(assigns(:milestone))
  end

  test "should destroy milestone" do
    assert_difference('Milestone.count', -1) do
      delete :destroy, :id => @milestone.to_param
    end

    assert_redirected_to milestones_path
  end
end
