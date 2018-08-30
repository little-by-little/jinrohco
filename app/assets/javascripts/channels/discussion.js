App.discussion = App.cable.subscriptions.create("DiscussionChannel", {
  connected: function(){

  },
  // Called when the subscription is ready for use on the server
  disconnected: function(){

  },
  // Called when the subscription has been terminated by the server
  received: function(data){
    // ここでチャットの入力があったあとにする処理を書く
    // とりあえず入力されたチャットを追加する
    var chat_el = document.createElement('p')
    chat_el.textContent = data['message'][1]
    document.getElementById('chat_field').appendChild(chat_el)
  },
  // Called when there's incoming data on the websocket for this channel
  speak: function(v_id, chat){
    return this.perform('speak', { message: [v_id, chat] });
  }
});
