defmodule <%= @appmod %>.Support.AfmRegistry do
  use Ash.Registry

  entries do
    entry <%= @appmod %>.Support.Ticket
    entry <%= @appmod %>.Support.Representative
  end
end
