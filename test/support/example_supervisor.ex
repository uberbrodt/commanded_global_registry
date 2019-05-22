defmodule Commanded.GlobalRegistry.ExampleSupervisor do
  @moduledoc false
  use DynamicSupervisor
  use Commanded.Registration
  alias Commanded.GlobalRegistry.SupervisedServer

  def start_link(args) do
    DynamicSupervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(args) do
    DynamicSupervisor.init(strategy: :one_for_one, extra_arguments: args)
  end

  def start_child(name) do
    Registration.start_child(name, __MODULE__, {SupervisedServer, []})
  end
end
