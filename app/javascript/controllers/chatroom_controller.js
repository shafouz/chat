import consumer from "../channels/consumer"

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "messages" ]

  initialize() {
    this.subscription = consumer.subscriptions.create(

    { channel: "ChatroomChannel", chatroom: this.data.get('id') }, {
      connected: this._connected.bind(this),
      disconnected: this._disconnected.bind(this),
      received: this._received.bind(this)
    }) 

    console.log('hello')
  }

  disconnect() {
    consumer.subscriptions.remove(this.subscription)

    console.log('bye')
  }

  //
  _connected(){
  }
  _disconnected(){}
  _received(data){
    this.messagesTarget.append(data.body)
  }
}
