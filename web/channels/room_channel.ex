defmodule WebsocketsTest.RoomChannel do
  use Phoenix.Channel

  def join("room:main", _message, socket) do
    {:ok, socket}
  end

  def join(_room, _params, _socket) do
    {:error, %{reason: "you can only join the lobby"}}
  end

  def handle_in("new_message", message, socket) do
    {status, result} = Poison.Parser.parse(message)
    resp = %{
      userId: result["userId"],
      body: result["body"],
      timestamp: result["timestamp"]
    }
    broadcast! socket, "new_message", resp
    {:noreply, socket}
    # {:reply, {:ok, resp}, socket}
  end

  def handle_in("color_switch", message, socket) do
    {status, result} = Poison.Parser.parse(message)
    resp = %{
      color_switch: result["color_switch"]
    }
    broadcast! socket, "color_switch", resp
    {:noreply, socket}
  end
end
