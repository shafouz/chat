import consumer from "../channels/consumer"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "messages", "users" ]

  initialize() {
    this.subscription = consumer.subscriptions.create(
      { channel: "ChatroomChannel", chatroom: this.data.get('id') }, {
        connected: this._connected.bind(this),
        disconnected: this._disconnected.bind(this),
        received: this._received.bind(this)
      }) 
  }

  connect() {
  }

  disconnect() {
    consumer.subscriptions.remove(this.subscription)
  }

  reset_form() {
    document.getElementById('message_text').value = ''
  }

  //
  _connected(){
  }

  _disconnected(){
  }

  _received(data){
    // message
    if ('message' in data) {
      return this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
    }

    // chatroom
    if ('username' in data.chatroom) {
      // checks if user already appended
      let username = document.getElementById(data.chatroom.user)
      if (!!!username) {
        this.usersTarget.insertAdjacentHTML('beforeend', data.chatroom.username)
      }
    }

    if ('status' in data.chatroom) {
      if (data.chatroom.status == false) {
        document.getElementById(data.chatroom.user).style.color = 'black'
      } else {
        document.getElementById(data.chatroom.user).style.color = 'green'
      }
    }
  }
}
