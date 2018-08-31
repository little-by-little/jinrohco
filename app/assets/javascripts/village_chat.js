function chat_send(input_el) {
  App.discussion.speak(input_el.value);
  input_el.value = '';
  return event.preventDefault();
}