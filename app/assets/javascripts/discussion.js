function discussion_send(el) {
  console.log(el)
  App.discussion.speak(el.value);
  el.value = '';
  return event.preventDefault();
}