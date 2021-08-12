require "application_system_test_case"

class StimulusChatroomControllersTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit stimulus_chatroom_controllers_url

    assert_selector "p", class: "notice"
    puts "********************************************************************************************************************************************************************************************************"
  end
end
