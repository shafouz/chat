require "application_system_test_case"

class StimulusChatroomControllersTest < ApplicationSystemTestCase
  def setup
    User.create(name: 'abc', email: 'abc@abc.com', password: 'secret')
    Chatroom.create(name: 'chat1')
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
  end
end
