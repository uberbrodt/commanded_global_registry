defmodule Commanded.GlobalRegistry.NodeSetup do
  @moduledoc false

  def setup_node(node) do
    rpc(node, Application, :ensure_all_started, [:commanded])
    args = []
    rpc(node, Commanded.GlobalRegistry.ExampleSupervisor, :start_link, [args])
  end

  def rpc(node, module, fun, args) do
    :rpc.block_call(node, module, fun, args)
  end
end
