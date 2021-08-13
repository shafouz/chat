import consumer from "../channels/consumer"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "users" ]

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

  _connected(){
  }

  _disconnected(){
  }

  _received(data){
    if ('username' in data.chatroom) {
      let user = document.getElementById(data.chatroom.userId)
      if (!!!user) {
        this.usersTarget.insertAdjacentHTML('beforeend', data.chatroom.username)
      }
    }

    if ('status' in data.chatroom) {
      if (data.chatroom.status == false) {
        document.getElementById(data.chatroom.userId).style.color = 'black'
      } else {
        document.getElementById(data.chatroom.userId).style.color = 'green'
      }
    }
  }
}
