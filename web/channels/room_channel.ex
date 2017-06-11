defmodule WebsocketsTest.RoomChannel do
  use Phoenix.Channel

  def join("room:main", _message, socket) do
    {:ok, client} = Exredis.start_link
    messages = get_messages(client)
    resp = %{messages: messages}

    {:ok, resp, socket}
  end

  def join(_room, _params, _socket) do
    {:error, %{reason: "you can only join the lobby"}}
  end

  def handle_in("new_message", message, socket) do
    {_, result} = Poison.Parser.parse(message)
    resp = %{
      userId: result["userId"],
      body: result["body"],
      timestamp: result["timestamp"]
    }

    {:ok, client} = Exredis.start_link
    client |> Exredis.query(["SET", resp.timestamp, message])

    broadcast! socket, "new_message", resp
    {:noreply, socket}
    # {:reply, {:ok, resp}, socket}
  end

  def handle_in("color_switch", message, socket) do
    {_, result} = Poison.Parser.parse(message)
    resp = %{
      color_switch: result["color_switch"]
    }
    broadcast! socket, "color_switch", resp
    {:noreply, socket}
  end

  def get_messages(client) do
    keys = client |> Exredis.query(["KEYS", "*"])

    Enum.map keys, fn key ->
      value = client |> Exredis.query(["GET", key])
      value
    end
  end
end
