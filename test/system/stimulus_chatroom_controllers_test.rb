require "application_system_test_case"

class StimulusChatroomControllersTest < ApplicationSystemTestCase
  def setup
    User.create(name: 'abc', email: 'abc@abc.com', password: 'secret')
  end

  def teardown
    ChatroomUser.delete_all
    Message.delete_all
    Chatroom.delete_all
    User.delete_all
  end

  test "visiting chatroom 1" do
    visit sign_in_path
    fill_in('email', with: 'abc@abc.com')
    fill_in('password', with: 'secret')
    click_on('commit')
    assert true, page.has_content?('Logged in successfully')

    click_on('Chatrooms')
    click_on('New Chatroom')
    fill_in('chatroom[name]', with: 'chat1')
    click_on('commit')
    assert true, page.has_content?('chat1')
    assert true, page.has_content?('abc')

    fill_in('message[text]', with: 'hello')
    click_on('commit')
    assert true, page.has_content?('hello')

    fill_in('message[text]', with: 'testing')
    click_on('commit')
    assert true, page.has_content?('testing')
  end
end
