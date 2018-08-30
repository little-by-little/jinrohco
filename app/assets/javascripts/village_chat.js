function chat_send(village_id, chat) {
  // console.log(village_id.value)
  // console.log(chat.value)
  App.discussion.speak(village_id.value, chat.value);
  chat.value = '';
  return event.preventDefault();
}