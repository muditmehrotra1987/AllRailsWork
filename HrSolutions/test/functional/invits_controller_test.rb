require 'test_helper'

class InvitsControllerTest < ActionController::TestCase
  setup do
    @invit = invits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invit" do
    assert_difference('Invit.count') do
      post :create, invit: { recipient_email: @invit.recipient_email, sender_id: @invit.sender_id, sent_at: @invit.sent_at, token: @invit.token }
    end

    assert_redirected_to invit_path(assigns(:invit))
  end

  test "should show invit" do
    get :show, id: @invit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invit
    assert_response :success
  end

  test "should update invit" do
    put :update, id: @invit, invit: { recipient_email: @invit.recipient_email, sender_id: @invit.sender_id, sent_at: @invit.sent_at, token: @invit.token }
    assert_redirected_to invit_path(assigns(:invit))
  end

  test "should destroy invit" do
    assert_difference('Invit.count', -1) do
      delete :destroy, id: @invit
    end

    assert_redirected_to invits_path
  end
end
