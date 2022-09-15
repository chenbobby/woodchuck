defmodule Woodchuck.LogMaker do
  @moduledoc """
  A GenServer that makes logs.
  """
  use GenServer
  require Logger

  @interval_ms 1000

  def start_link(init_arg) when is_list(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @impl GenServer
  def init(state) do
    Process.send_after(self(), :make_log, @interval_ms)
    {:ok, state}
  end

  @impl GenServer
  def handle_info(:make_log, state) do
    Logger.info("LogMaker made a log.")
    Process.send_after(self(), :make_log, @interval_ms)
    {:noreply, state}
  end
end
