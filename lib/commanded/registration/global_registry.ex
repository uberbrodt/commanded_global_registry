defmodule Commanded.Registration.GlobalRegistry do
  @moduledoc """
  Documentation for Commanded.Registration.Global.
  """

  @behaviour Commanded.Registration

  @impl Commanded.Registration
  def child_spec do
      [%{
        id: __MODULE__,
        start: {__MODULE__, :ignore, [[]]},
        restart: :temporary,
        shutdown: 1,
        type: :worker
      }]
  end

  def ignore(_) do
    :ignore
  end

  @impl Commanded.Registration
  def supervisor_child_spec(module, arg) do

    default = %{
     id: module,
     start: {module, :start_link, [arg]},
     type: :supervisor
    }

    Supervisor.child_spec(default, [])
  end

  @impl Commanded.Registration
  def start_child(name, supervisor, {module, args}) do
    via_name = via_tuple(name)

    child_spec ={module, Keyword.put(args, :name, via_name)}

    case DynamicSupervisor.start_child(supervisor, child_spec) do
      {:error, {:already_started, pid}} -> {:ok, pid}
      reply -> reply
    end
  end

  @impl Commanded.Registration
  def start_link(name, supervisor, args) do
    via_name = via_tuple(name)

    case GenServer.start_link(supervisor, args, name: via_name) do
      {:error, {:already_started, pid}} -> {:ok, pid}
      reply -> reply
    end
  end

  @impl Commanded.Registration
  def whereis_name(name) do
    :global.whereis_name(name)
  end

  @impl Commanded.Registration
  def via_tuple(name) do
    {:global, name}
  end
end
