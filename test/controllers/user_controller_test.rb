require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get '/users/new'
    assert_response :success
  end

  test 'should get create' do
    get '/users/create'
    assert_response :redirect
  end

  test 'should redirect' do
    get '/users'
    assert_response :redirect
  end

  test 'should have current_user' do
    assert true, defined?(current_user)
  end
end
