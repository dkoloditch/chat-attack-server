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
    resp = %{body: result["body"]}
    broadcast! socket, "new_message", resp
    # {:noreply, socket}
    {:reply, {:ok, resp}, socket}
  end

  # def handle_in("echo", message, socket) do
  #   IO.puts "************** echo"
  #   resp = %{body: message["body"], type: "echo"}
  #   {:reply, {:ok, resp}, socket}
  # end
  #
  # def handle_in("broadcast", message, socket) do
  #   IO.puts "************** broadcast"
  #   bcast = %{body: message["body"], type: "broadcast"}
  #   broadcast! socket, "broadcast", bcast
  #   resp = %{body: message["body"], type: "broadcastResult"}
  #   {:reply, {:ok, resp}, socket}
  # end
end
