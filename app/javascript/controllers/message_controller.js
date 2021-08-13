import consumer from "../channels/consumer"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "messages" ]

  initialize() {
    this.subscription = consumer.subscriptions.create(
      { channel: "MessageChannel", message: this.element.dataset.chatroomId }, {
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

  _connected(){
  }

  _disconnected(){
  }

  _received(data){
    this.messagesTarget.insertAdjacentHTML('beforeend', data.message)
  }
}
