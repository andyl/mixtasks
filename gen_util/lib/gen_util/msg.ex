defmodule GenUtil.Msg do

  def injected(message) do
    text = IO.ANSI.green() <> "* injected " <> IO.ANSI.reset()
    IO.puts text <> message
  end

  def instructions(divider, message) do
    text = IO.ANSI.green() <> "----- #{divider} -----\n\n" <> IO.ANSI.reset()
    IO.puts text <> message
  end

end
