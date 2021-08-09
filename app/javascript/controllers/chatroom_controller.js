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
    this.subscription.perform('set_online')
    console.log('hello')
  }

  disconnect() {
    //this.subscription.perform('set_offline', { id: this.data.get('id')} )
    consumer.subscriptions.remove(this.subscription)
    console.log('bye')
  }

  reset_form() {
    document.getElementById('message_text').value = ''
  }

  //
  _connected(){
  }
  _disconnected(){}

  _received(data){
    if ('message' in data) {
      this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
    }

    if ('user' in data) {
      this.usersTarget.insertAdjacentHTML('beforeend', data.user)
    }

    if ('user_status' in data) {
    }
  }
}
