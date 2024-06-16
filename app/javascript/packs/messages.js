
$( document ).on('turbolinks:load', function() {
  if ($('.rabin-room').length > 0) {
    $('#message_sender').val(0);
  }
  if ($('.crush-room').length > 0) {
    $('#message_sender').val(1);
  }

  var messages = $('.chatroom_history_list');
  messages.scrollTop(messages[0].scrollHeight);
});