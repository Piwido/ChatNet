// Import all the channels to be used by Action Cable

consumer.subscriptions.create("ChatroomChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
        console.log("2 - Hello from the chatroom_channel.js file");
        console.log("2 - Subscribed to the chatroom :", this);


    },

    disconnected() {
        // Called when the subscription has been terminated by the server
        console.log("n/n - Disconnected from the chatroom!");
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log(data);
        $('#new-messages').append(data.mod_message);
        $('#new_message_form').trigger('reset');
    }

    
});