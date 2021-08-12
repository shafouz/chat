import consumer from "../channels/consumer"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "messages", "users" ]

  initialize() {
    console.log('init-non')
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
    if ('message' in data) {
      this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
    }

    if ('user' in data) {
      this.usersTarget.insertAdjacentHTML('beforeend', data.user)
    }

    if ('status' in data) {
      if (data.status.status == false) {
        document.getElementById(data.status.user).style.color = 'black'
      } else {
        document.getElementById(data.status.user).style.color = 'green'
      }
    }
  }
}
