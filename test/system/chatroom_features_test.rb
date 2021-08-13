require "application_system_test_case"

class ChatroomFeaturesTest < ApplicationSystemTestCase
  def setup
    @user = User.create(name: 'abc', email: 'abc@abc.com', password: 'secret')
  end

  def teardown
    ChatroomUser.delete_all
    Message.delete_all
    Chatroom.delete_all
    User.delete_all
  end

  test 'logs in' do
    visit sign_in_path
    fill_in('email', with: 'abc@abc.com')
    fill_in('password', with: 'secret')
    click_on('commit')
    assert true, page.has_content?('Logged in successfully')
  end

  test "messages get appended to page" do
    # logs in
    visit sign_in_path
    fill_in('email', with: 'abc@abc.com')
    fill_in('password', with: 'secret')
    click_on('commit')
    assert true, page.has_content?('Logged in successfully')

    # creates room
    click_on('Chatrooms')
    click_on('New Chatroom')
    fill_in('chatroom[name]', with: 'chat1')
    click_on('commit')
    assert true, page.has_content?('chat1')
    assert true, page.has_content?('abc')

    # checks if message is added to page
    fill_in('message[text]', with: 'hello')
    click_on('commit')
    assert true, page.has_content?('hello')

    # checks if message is added to page
    fill_in('message[text]', with: 'testing')
    click_on('commit')
    assert true, page.has_content?('testing')
  end

  test "user gets added to page and has correct color" do
    # logs in
    visit sign_in_path
    fill_in('email', with: 'abc@abc.com')
    fill_in('password', with: 'secret')
    click_on('commit')
    assert true, page.has_content?('Logged in successfully')

    # creates room
    click_on('Chatrooms')
    click_on('New Chatroom')
    fill_in('chatroom[name]', with: 'chat1')
    click_on('commit')
    assert true, page.has_content?('chat1')
    assert true, page.has_content?('abc')
    assert true, page.has_xpath?('//div', id: /chatroom_user_/)
    page.assert_selector('div.true', count: 1)
    find(:xpath, '//div', id: /chatroom_user_/).assert_matches_style('color': 'rgb(0, 128, 0)')
  end

end
