defmodule GenUtil.Domain do

  def path(%{appname: app, namespace: nil}), do: "#{app}"
  def path(%{appname: app, namespace: name}), do: "#{app}/#{name}"

  def path(%{appname: app, namespace: nil}, dir), do: "#{app}/#{dir}"
  def path(domain, dir), do: path(domain) <> dir

  def module(%{appname: app, namespace: nil}), do: camelize(app)
  def module(%{appname: app, namespace: name}), do: "#{camelize(app)}.#{camelize(name)}"

  def module(%{appname: app, namespace: nil}, mod), do: "#{camelize(app)}.#{camelize(mod)}"
  def module(domain, mod), do: "#{module(domain)}.#{camelize(mod)}"

  def appmod(arg), do: module(arg)

  defp camelize(item) do
    Inflex.camelize(item)
  end

end
