App.chats = App.cable.subscriptions.create 'ChatsChannel',
  connected: ->
    @install()
    @enterRoom()

  received: (data) ->
    $('#chats').prepend(data.chat)

  enterRoom: ->
    roomId = $('#chats').data('room-id')

    if roomId
      @perform('enter', room_id: roomId)
    else
      @perform('leave')

  install: ->
    $(document).on('page:change', -> App.chats.enterRoom())
