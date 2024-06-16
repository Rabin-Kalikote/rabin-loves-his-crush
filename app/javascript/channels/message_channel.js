import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console .log('connected to message channel');
  },

  disconnected() {
    console.log('disconnected from message channel');
  },

  received(data) {
    var messages = $('.chatroom_history_list');
    var message = $(data['message']);
    messages.append(message);
    messages.scrollTop(messages[0].scrollHeight);
    $('#message_body').val('');
  }
});
