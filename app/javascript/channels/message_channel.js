import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.name.name}：${data.content.text}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('message_text');
    messages.insertAdjacentHTML('afterend', html);
    newMessage.value='';
  }
});
