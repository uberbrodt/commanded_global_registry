# Commanded.Registration.Global

A implementation of `Commanded.Registration` to be used with the
[Commanded](https://github.com/commanded/commanded) event sourcing framework for
Elixir.

### Status
Currently in testing with some production projects and seems to perform well.
There are some scalability limits with the `:global` module, documented
[here](http://www.ostinelli.net/an-evaluation-of-erlang-global-process-registries-meet-syn/).
However, without benchmarking it is hard to know exactly what those limits are in
the context of a Commanded application.

This project uses an unreleased version of the Commanded framework, relying on
some changes to Commanded.Registration that I submitted. Thus, I cannot
push this project to hex.pm now, but I will as soon as I am able.


## Roadmap

- [ ] Benchmark an example Commanded app using this Registry

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `commanded_global_registry` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:commanded_global_registry, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/commanded_global_registry](https://hexdocs.pm/commanded_global_registry).

