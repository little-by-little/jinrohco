// document.addEventListener('turbolinks:load', function () {
  var v_id = document.getElementById('village_id').value
  App.discussion = App.cable.subscriptions.create({ channel: "DiscussionChannel", id: v_id}, {
    connected: function () {
    },
    
    // Called when the subscription is ready for use on the server
    disconnected: function () {
    },

    // Called when the subscription has been terminated by the server
    received: function (data) {
      // ここでチャットの入力があったあとにする処理を書く
      // とりあえず入力されたチャットを追加する
      // data['speaker'] == speaker_id
      // data['body']    == chat_body
      if(data['v_id'] === v_id){
        var div = document.createElement('div')
        div.classList.add('balloon-right')
        div.classList.add('speaker_id_' + data['speaker'])
        var text = document.createElement('p')
        text.textContent = data['body']
    
        div.appendChild(text)
        document.getElementById('chat_field').appendChild(div)
      }
    },
    // Called when there's incoming data on the websocket for this channel
    speak: function (message) {
      return this.perform('speak', { message: message, v_id: v_id });
    }
  });
// });


