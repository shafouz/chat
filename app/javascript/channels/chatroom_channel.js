import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data);
    let body = document.getElementById("body");
    body.style.backgroundColor = "black";
    // Called when there's incoming data on the websocket for this channel
  }
});
