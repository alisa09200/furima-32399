import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // const html = `<p>${data.user.nickname}:${data.content.text}</p>`;
    const html = `<p>${data.user.nickname}: ${data.content.text}</p>`;
    const comment = document.getElementById('comment');
    const newComment = document.getElementById('comment_text');
    comment.insertAdjacentHTML('afterbegin', html);
    debugger
    newComment.value='';
  }
});
